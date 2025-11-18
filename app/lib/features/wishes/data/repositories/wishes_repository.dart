import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/models/wish.dart';

class WishesRepository {
  final Dio _dio;

  WishesRepository(this._dio);

  Future<List<Wish>> getWishesByWishlist(int wishlistId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/wishlists/$wishlistId/wishes');
      final List<dynamic> wishesJson = response.data!['wishes'] as List<dynamic>;
      return wishesJson.map((json) => Wish.fromJson(json as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Wish> getWish(int id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/wishes/$id');
      return Wish.fromJson(response.data!['wish'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<ParseWishResponse> parseWish(String url) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/wishes/parse',
        data: {
          'url': url,
        },
      );

      return ParseWishResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Wish> createWish(CreateWishRequest request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/wishes',
        data: {
          'wish': request.toJson(),
        },
      );

      return Wish.fromJson(response.data!['wish'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Wish> updateWish(int id, CreateWishRequest request) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '/wishes/$id',
        data: {
          'wish': request.toJson(),
        },
      );

      return Wish.fromJson(response.data!['wish'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<void> deleteWish(int id) async {
    try {
      await _dio.delete<void>('/wishes/$id');
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}

// Provider
final wishesRepositoryProvider = Provider<WishesRepository>((ref) {
  return WishesRepository(ApiClient().dio);
});
