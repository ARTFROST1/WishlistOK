// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WishImpl _$$WishImplFromJson(Map<String, dynamic> json) => _$WishImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      productUrl: json['product_url'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      status: $enumDecode(_$WishStatusEnumMap, json['status']),
      wishlistId: (json['wishlist_id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      claimedBy: (json['claimed_by'] as num?)?.toInt(),
      claimedAt: json['claimed_at'] == null
          ? null
          : DateTime.parse(json['claimed_at'] as String),
      purchasedAt: json['purchased_at'] == null
          ? null
          : DateTime.parse(json['purchased_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      canClaim: json['can_claim'] as bool? ?? true,
      canEdit: json['can_edit'] as bool? ?? false,
      isClaimedByMe: json['is_claimed_by_me'] as bool? ?? false,
    );

Map<String, dynamic> _$$WishImplToJson(_$WishImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'product_url': instance.productUrl,
      'price': instance.price,
      'currency': instance.currency,
      'status': _$WishStatusEnumMap[instance.status]!,
      'wishlist_id': instance.wishlistId,
      'user_id': instance.userId,
      'claimed_by': instance.claimedBy,
      'claimed_at': instance.claimedAt?.toIso8601String(),
      'purchased_at': instance.purchasedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'can_claim': instance.canClaim,
      'can_edit': instance.canEdit,
      'is_claimed_by_me': instance.isClaimedByMe,
    };

const _$WishStatusEnumMap = {
  WishStatus.available: 'available',
  WishStatus.claimed: 'claimed',
  WishStatus.purchased: 'purchased',
};

_$ParseWishRequestImpl _$$ParseWishRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ParseWishRequestImpl(
      url: json['url'] as String,
    );

Map<String, dynamic> _$$ParseWishRequestImplToJson(
        _$ParseWishRequestImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

_$ParseWishResponseImpl _$$ParseWishResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ParseWishResponseImpl(
      title: json['title'] as String,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      productUrl: json['product_url'] as String,
      price: (json['price'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      success: json['success'] as bool? ?? true,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$ParseWishResponseImplToJson(
        _$ParseWishResponseImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'product_url': instance.productUrl,
      'price': instance.price,
      'currency': instance.currency,
      'success': instance.success,
      'error': instance.error,
    };

_$CreateWishRequestImpl _$$CreateWishRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateWishRequestImpl(
      title: json['title'] as String,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      productUrl: json['product_url'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      wishlistId: (json['wishlist_id'] as num).toInt(),
    );

Map<String, dynamic> _$$CreateWishRequestImplToJson(
        _$CreateWishRequestImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'product_url': instance.productUrl,
      'price': instance.price,
      'currency': instance.currency,
      'wishlist_id': instance.wishlistId,
    };
