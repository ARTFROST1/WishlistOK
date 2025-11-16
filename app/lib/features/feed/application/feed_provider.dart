import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/feed.dart';
import '../data/repositories/feed_repository.dart';

// Complete feed provider
final feedProvider = FutureProvider<FeedResponse>((ref) async {
  final repository = ref.read(feedRepositoryProvider);
  return repository.getFeed();
});

// Categories provider
final categoriesProvider = FutureProvider<List<FeedCategory>>((ref) async {
  final repository = ref.read(feedRepositoryProvider);
  return repository.getCategories();
});

// Featured collections provider
final featuredCollectionsProvider = FutureProvider<List<FeedCollection>>((ref) async {
  final repository = ref.read(feedRepositoryProvider);
  return repository.getFeaturedCollections();
});

// Trending items provider
final trendingItemsProvider = FutureProvider<List<FeedItem>>((ref) async {
  final repository = ref.read(feedRepositoryProvider);
  return repository.getTrendingItems();
});

// Single collection provider
final collectionProvider = FutureProvider.family<FeedCollection, int>((ref, id) async {
  final repository = ref.read(feedRepositoryProvider);
  return repository.getCollection(id);
});

// Items by category provider
final categoryItemsProvider = FutureProvider.family<List<FeedItem>, int>((ref, categoryId) async {
  final repository = ref.read(feedRepositoryProvider);
  return repository.getItemsByCategory(categoryId);
});
