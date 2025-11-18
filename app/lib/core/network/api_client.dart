import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../config/app_config.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;
  ApiClient._internal();

  late final Dio _dio;
  final _storage = const FlutterSecureStorage();

  void initialize() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.apiBaseUrl,
        connectTimeout: AppConfig.connectTimeout,
        receiveTimeout: AppConfig.apiTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors
    _dio.interceptors.add(_AuthInterceptor(_storage));
    
    if (AppConfig.enableLogs) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (obj) => print('[API] $obj'),
        ),
      );
    }
  }

  Dio get dio => _dio;

  // Auth methods
  Future<void> setAuthToken(String token) async {
    await _storage.write(key: AppConfig.jwtTokenKey, value: token);
  }

  Future<void> setGuestToken(String token) async {
    await _storage.write(key: AppConfig.guestTokenKey, value: token);
  }

  Future<void> clearTokens() async {
    await _storage.delete(key: AppConfig.jwtTokenKey);
    await _storage.delete(key: AppConfig.refreshTokenKey);
    await _storage.delete(key: AppConfig.guestTokenKey);
  }

  Future<String?> getToken() async {
    // Try JWT token first, then guest token
    String? token = await _storage.read(key: AppConfig.jwtTokenKey);
    token ??= await _storage.read(key: AppConfig.guestTokenKey);
    return token;
  }
}

class _AuthInterceptor extends QueuedInterceptor {
  final FlutterSecureStorage _storage;

  _AuthInterceptor(this._storage);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Get token from secure storage
    String? token = await _storage.read(key: AppConfig.jwtTokenKey);
    token ??= await _storage.read(key: AppConfig.guestTokenKey);

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Handle 401 Unauthorized - clear tokens
    if (err.response?.statusCode == 401) {
      await _storage.delete(key: AppConfig.jwtTokenKey);
      await _storage.delete(key: AppConfig.refreshTokenKey);
      await _storage.delete(key: AppConfig.guestTokenKey);
      // Auth state will be handled by the auth provider watching token changes
    }

    handler.next(err);
  }
}

// API Exception handling
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiException(this.message, {this.statusCode, this.data});

  @override
  String toString() => 'ApiException: $message';

  factory ApiException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException('Connection timeout. Please try again.');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;

        // Extract error message from backend response format
        // Backend returns: {success: false, error: {message: "...", details: [...]}}
        String message = 'Unknown server error';
        if (data is Map<String, dynamic>) {
          if (data['error'] is Map<String, dynamic>) {
            final errorData = data['error'] as Map<String, dynamic>;
            message = errorData['message']?.toString() ?? message;

            // Append validation details if present
            if (errorData['details'] is List && (errorData['details'] as List).isNotEmpty) {
              final details = (errorData['details'] as List).join(', ');
              message = '$message: $details';
            }
          } else if (data['message'] != null) {
            message = data['message'].toString();
          }
        }

        return ApiException(message, statusCode: statusCode, data: data);
      case DioExceptionType.cancel:
        return ApiException('Request was cancelled');
      case DioExceptionType.connectionError:
        return ApiException('No internet connection. Check your network.');
      case DioExceptionType.badCertificate:
        return ApiException('Invalid certificate');
      case DioExceptionType.unknown:
        return ApiException('An unexpected error occurred');
    }
  }
}
