import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed.freezed.dart';
part 'feed.g.dart';

@freezed
class FeedCategory with _$FeedCategory {
  const factory FeedCategory({
    required int id,
    required String name,
    required String slug,
    @JsonKey(name: 'icon_url') String? iconUrl,
    String? description,
    @JsonKey(name: 'items_count') @Default(0) int itemsCount,
  }) = _FeedCategory;

  factory FeedCategory.fromJson(Map<String, dynamic> json) => _$FeedCategoryFromJson(json);
}

@freezed
class FeedCollection with _$FeedCollection {
  const factory FeedCollection({
    required int id,
    required String title,
    required String slug,
    String? description,
    @JsonKey(name: 'cover_image_url') String? coverImageUrl,
    @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(name: 'is_featured') @Default(false) bool isFeatured,
    @JsonKey(name: 'is_sponsored') @Default(false) bool isSponsored,
    @JsonKey(name: 'items_count') @Default(0) int itemsCount,
    List<FeedItem>? items,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _FeedCollection;

  factory FeedCollection.fromJson(Map<String, dynamic> json) => _$FeedCollectionFromJson(json);
}

@freezed
class FeedItem with _$FeedItem {
  const factory FeedItem({
    required int id,
    required String title,
    String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'product_url') String? productUrl,
    double? price,
    String? currency,
    @JsonKey(name: 'collection_id') required int collectionId,
    @JsonKey(name: 'brand_name') String? brandName,
    @JsonKey(name: 'is_sponsored') @Default(false) bool isSponsored,
    @JsonKey(name: 'click_count') @Default(0) int clickCount,
    @JsonKey(name: 'add_count') @Default(0) int addCount,
  }) = _FeedItem;

  factory FeedItem.fromJson(Map<String, dynamic> json) => _$FeedItemFromJson(json);
}

@freezed
class FeedResponse with _$FeedResponse {
  const factory FeedResponse({
    required List<FeedCategory> categories,
    @JsonKey(name: 'featured_collections') required List<FeedCollection> featuredCollections,
    @JsonKey(name: 'trending_items') required List<FeedItem> trendingItems,
  }) = _FeedResponse;

  factory FeedResponse.fromJson(Map<String, dynamic> json) => _$FeedResponseFromJson(json);
}
