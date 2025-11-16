// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedCategoryImpl _$$FeedCategoryImplFromJson(Map<String, dynamic> json) =>
    _$FeedCategoryImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      iconUrl: json['icon_url'] as String?,
      description: json['description'] as String?,
      itemsCount: (json['items_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FeedCategoryImplToJson(_$FeedCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'icon_url': instance.iconUrl,
      'description': instance.description,
      'items_count': instance.itemsCount,
    };

_$FeedCollectionImpl _$$FeedCollectionImplFromJson(Map<String, dynamic> json) =>
    _$FeedCollectionImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String?,
      coverImageUrl: json['cover_image_url'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      isFeatured: json['is_featured'] as bool? ?? false,
      isSponsored: json['is_sponsored'] as bool? ?? false,
      itemsCount: (json['items_count'] as num?)?.toInt() ?? 0,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => FeedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$FeedCollectionImplToJson(
        _$FeedCollectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'cover_image_url': instance.coverImageUrl,
      'category_id': instance.categoryId,
      'is_featured': instance.isFeatured,
      'is_sponsored': instance.isSponsored,
      'items_count': instance.itemsCount,
      'items': instance.items,
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$FeedItemImpl _$$FeedItemImplFromJson(Map<String, dynamic> json) =>
    _$FeedItemImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      productUrl: json['product_url'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      collectionId: (json['collection_id'] as num).toInt(),
      brandName: json['brand_name'] as String?,
      isSponsored: json['is_sponsored'] as bool? ?? false,
      clickCount: (json['click_count'] as num?)?.toInt() ?? 0,
      addCount: (json['add_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FeedItemImplToJson(_$FeedItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'product_url': instance.productUrl,
      'price': instance.price,
      'currency': instance.currency,
      'collection_id': instance.collectionId,
      'brand_name': instance.brandName,
      'is_sponsored': instance.isSponsored,
      'click_count': instance.clickCount,
      'add_count': instance.addCount,
    };

_$FeedResponseImpl _$$FeedResponseImplFromJson(Map<String, dynamic> json) =>
    _$FeedResponseImpl(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => FeedCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      featuredCollections: (json['featured_collections'] as List<dynamic>)
          .map((e) => FeedCollection.fromJson(e as Map<String, dynamic>))
          .toList(),
      trendingItems: (json['trending_items'] as List<dynamic>)
          .map((e) => FeedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FeedResponseImplToJson(_$FeedResponseImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'featured_collections': instance.featuredCollections,
      'trending_items': instance.trendingItems,
    };
