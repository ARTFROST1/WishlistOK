import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/models/user.dart';

class AuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post('/auth/sign_in', data: {
        'user': {
          'email': email,
          'password': password,
        },
      });

      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String firstName,
    String? lastName,
  }) async {
    try {
      final response = await _dio.post('/auth', data: {
        'user': {
          'email': email,
          'password': password,
          'first_name': firstName,
          'last_name': lastName,
        },
      });

      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _dio.delete('/auth/sign_out');
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<AuthResponse> createGuestUser() async {
    try {
      final response = await _dio.post('/auth/guests');
      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<User> getCurrentUser() async {
    try {
      final response = await _dio.get('/auth/me');
      return User.fromJson(response.data['user']);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<AuthResponse> refreshToken() async {
    try {
      final response = await _dio.post('/auth/refresh');
      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}

// Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ApiClient().dio);
});
