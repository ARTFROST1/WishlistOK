import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/models/wishlist.dart';

class WishlistsRepository {
  final Dio _dio;

  WishlistsRepository(this._dio);

  Future<WishlistsResponse> getWishlists({
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      final response = await _dio.get('/wishlists', queryParameters: {
        'page': page,
        'per_page': perPage,
      });

      return WishlistsResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Wishlist> getWishlist(int id) async {
    try {
      final response = await _dio.get('/wishlists/$id');
      return Wishlist.fromJson(response.data['wishlist']);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Wishlist> getWishlistBySlug(String slug) async {
    try {
      final response = await _dio.get('/wishlists/by_slug/$slug');
      return Wishlist.fromJson(response.data['wishlist']);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Wishlist> createWishlist(CreateWishlistRequest request) async {
    try {
      final response = await _dio.post('/wishlists', data: {
        'wishlist': request.toJson(),
      });

      return Wishlist.fromJson(response.data['wishlist']);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Wishlist> updateWishlist(int id, CreateWishlistRequest request) async {
    try {
      final response = await _dio.put('/wishlists/$id', data: {
        'wishlist': request.toJson(),
      });

      return Wishlist.fromJson(response.data['wishlist']);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<void> deleteWishlist(int id) async {
    try {
      await _dio.delete('/wishlists/$id');
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Map<String, String>> getShareUrls(int id) async {
    try {
      final response = await _dio.get('/wishlists/$id/share');
      return Map<String, String>.from(response.data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}

// Provider
final wishlistsRepositoryProvider = Provider<WishlistsRepository>((ref) {
  return WishlistsRepository(ApiClient().dio);
});
