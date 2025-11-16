// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WishlistImpl _$$WishlistImplFromJson(Map<String, dynamic> json) =>
    _$WishlistImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      eventDate: json['event_date'] == null
          ? null
          : DateTime.parse(json['event_date'] as String),
      visibility: $enumDecode(_$WishlistVisibilityEnumMap, json['visibility']),
      slug: json['slug'] as String,
      shareToken: json['share_token'] as String?,
      userId: (json['user_id'] as num).toInt(),
      wishesCount: (json['wishes_count'] as num?)?.toInt() ?? 0,
      availableWishesCount:
          (json['available_wishes_count'] as num?)?.toInt() ?? 0,
      claimedWishesCount: (json['claimed_wishes_count'] as num?)?.toInt() ?? 0,
      totalValue: (json['total_value'] as num?)?.toDouble(),
      claimedValue: (json['claimed_value'] as num?)?.toDouble(),
      shareUrl: json['share_url'] as String?,
      publicUrl: json['public_url'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      wishes: (json['wishes'] as List<dynamic>?)
          ?.map((e) => Wish.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WishlistImplToJson(_$WishlistImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'event_date': instance.eventDate?.toIso8601String(),
      'visibility': _$WishlistVisibilityEnumMap[instance.visibility]!,
      'slug': instance.slug,
      'share_token': instance.shareToken,
      'user_id': instance.userId,
      'wishes_count': instance.wishesCount,
      'available_wishes_count': instance.availableWishesCount,
      'claimed_wishes_count': instance.claimedWishesCount,
      'total_value': instance.totalValue,
      'claimed_value': instance.claimedValue,
      'share_url': instance.shareUrl,
      'public_url': instance.publicUrl,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'wishes': instance.wishes,
    };

const _$WishlistVisibilityEnumMap = {
  WishlistVisibility.public: 'public',
  WishlistVisibility.linkOnly: 'link_only',
  WishlistVisibility.private: 'private',
};

_$WishlistsResponseImpl _$$WishlistsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WishlistsResponseImpl(
      wishlists: (json['wishlists'] as List<dynamic>)
          .map((e) => Wishlist.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      currentPage: (json['current_page'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
    );

Map<String, dynamic> _$$WishlistsResponseImplToJson(
        _$WishlistsResponseImpl instance) =>
    <String, dynamic>{
      'wishlists': instance.wishlists,
      'total': instance.total,
      'per_page': instance.perPage,
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
    };

_$CreateWishlistRequestImpl _$$CreateWishlistRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateWishlistRequestImpl(
      title: json['title'] as String,
      description: json['description'] as String?,
      eventDate: json['event_date'] == null
          ? null
          : DateTime.parse(json['event_date'] as String),
      visibility: $enumDecodeNullable(
              _$WishlistVisibilityEnumMap, json['visibility']) ??
          WishlistVisibility.linkOnly,
    );

Map<String, dynamic> _$$CreateWishlistRequestImplToJson(
        _$CreateWishlistRequestImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'event_date': instance.eventDate?.toIso8601String(),
      'visibility': _$WishlistVisibilityEnumMap[instance.visibility]!,
    };
