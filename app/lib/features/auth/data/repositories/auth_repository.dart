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

      // Backend returns {success: true, data: {user: {...}, token: "..."}}
      return AuthResponse.fromJson(response.data['data'] as Map<String, dynamic>);
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
      final response = await _dio.post('/auth/sign_up', data: {
        'user': {
          'email': email,
          'password': password,
          'password_confirmation': password,
          'first_name': firstName,
          'last_name': lastName,
        },
      });

      // Backend returns {success: true, data: {user: {...}, token: "..."}}
      return AuthResponse.fromJson(response.data['data'] as Map<String, dynamic>);
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
      // Backend returns {success: true, data: {user: {...}, token: "..."}}
      return AuthResponse.fromJson(response.data['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<User> getCurrentUser() async {
    try {
      final response = await _dio.get('/users/me');
      // Backend returns {success: true, data: {user: {...}}}
      return User.fromJson(response.data['data']['user'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<AuthResponse> refreshToken() async {
    try {
      final response = await _dio.post('/auth/refresh');
      return AuthResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}

// Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ApiClient().dio);
});
