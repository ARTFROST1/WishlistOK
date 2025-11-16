import 'package:freezed_annotation/freezed_annotation.dart';

part 'wish.freezed.dart';
part 'wish.g.dart';

enum WishStatus {
  @JsonValue('available')
  available,
  @JsonValue('claimed')
  claimed,
  @JsonValue('purchased')
  purchased,
}

@freezed
class Wish with _$Wish {
  const factory Wish({
    required int id,
    required String title,
    String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'product_url') String? productUrl,
    double? price,
    String? currency,
    required WishStatus status,
    @JsonKey(name: 'wishlist_id') required int wishlistId,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'claimed_by') int? claimedBy,
    @JsonKey(name: 'claimed_at') DateTime? claimedAt,
    @JsonKey(name: 'purchased_at') DateTime? purchasedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    // Computed fields
    @JsonKey(name: 'can_claim') @Default(true) bool canClaim,
    @JsonKey(name: 'can_edit') @Default(false) bool canEdit,
    @JsonKey(name: 'is_claimed_by_me') @Default(false) bool isClaimedByMe,
  }) = _Wish;

  factory Wish.fromJson(Map<String, dynamic> json) => _$WishFromJson(json);
}

@freezed
class ParseWishRequest with _$ParseWishRequest {
  const factory ParseWishRequest({
    required String url,
  }) = _ParseWishRequest;

  factory ParseWishRequest.fromJson(Map<String, dynamic> json) => _$ParseWishRequestFromJson(json);
}

@freezed
class ParseWishResponse with _$ParseWishResponse {
  const factory ParseWishResponse({
    required String title,
    String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'product_url') required String productUrl,
    double? price,
    String? currency,
    @Default(true) bool success,
    String? error,
  }) = _ParseWishResponse;

  factory ParseWishResponse.fromJson(Map<String, dynamic> json) => _$ParseWishResponseFromJson(json);
}

@freezed
class CreateWishRequest with _$CreateWishRequest {
  const factory CreateWishRequest({
    required String title,
    String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'product_url') String? productUrl,
    double? price,
    String? currency,
    @JsonKey(name: 'wishlist_id') required int wishlistId,
  }) = _CreateWishRequest;

  factory CreateWishRequest.fromJson(Map<String, dynamic> json) => _$CreateWishRequestFromJson(json);
}
