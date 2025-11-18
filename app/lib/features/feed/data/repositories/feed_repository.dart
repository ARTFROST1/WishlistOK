import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/models/feed.dart';

class FeedRepository {
  final Dio _dio;

  FeedRepository(this._dio);

  Future<FeedResponse> getFeed() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/ideas');
      return FeedResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<List<FeedCategory>> getCategories() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/ideas/categories');
      final List<dynamic> categoriesJson = response.data!['categories'] as List<dynamic>;
      return categoriesJson.map((json) => FeedCategory.fromJson(json as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<List<FeedCollection>> getFeaturedCollections() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/ideas/featured');
      final List<dynamic> collectionsJson = response.data!['collections'] as List<dynamic>;
      return collectionsJson.map((json) => FeedCollection.fromJson(json as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<FeedCollection> getCollection(int id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/ideas/collections/$id');
      return FeedCollection.fromJson(response.data!['collection'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<List<FeedItem>> getTrendingItems() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/ideas/trending');
      final List<dynamic> itemsJson = response.data!['items'] as List<dynamic>;
      return itemsJson.map((json) => FeedItem.fromJson(json as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<List<FeedItem>> getItemsByCategory(int categoryId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/ideas/categories/$categoryId/items');
      final List<dynamic> itemsJson = response.data!['items'] as List<dynamic>;
      return itemsJson.map((json) => FeedItem.fromJson(json as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}

// Provider
final feedRepositoryProvider = Provider<FeedRepository>((ref) {
  return FeedRepository(ApiClient().dio);
});
