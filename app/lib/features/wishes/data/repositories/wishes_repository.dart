import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/models/wish.dart';

class WishesRepository {
  final Dio _dio;

  WishesRepository(this._dio);

  Future<List<Wish>> getWishesByWishlist(int wishlistId) async {
    try {
      final response = await _dio.get('/wishlists/$wishlistId/wishes');
      final List<dynamic> wishesJson = response.data['wishes'];
      return wishesJson.map((json) => Wish.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Wish> getWish(int id) async {
    try {
      final response = await _dio.get('/wishes/$id');
      return Wish.fromJson(response.data['wish']);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<ParseWishResponse> parseWish(String url) async {
    try {
      final response = await _dio.post('/wishes/parse', data: {
        'url': url,
      },);

      return ParseWishResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Wish> createWish(CreateWishRequest request) async {
    try {
      final response = await _dio.post('/wishes', data: {
        'wish': request.toJson(),
      },);

      return Wish.fromJson(response.data['wish']);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Wish> updateWish(int id, CreateWishRequest request) async {
    try {
      final response = await _dio.put('/wishes/$id', data: {
        'wish': request.toJson(),
      },);

      return Wish.fromJson(response.data['wish']);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<void> deleteWish(int id) async {
    try {
      await _dio.delete('/wishes/$id');
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}

// Provider
final wishesRepositoryProvider = Provider<WishesRepository>((ref) {
  return WishesRepository(ApiClient().dio);
});
