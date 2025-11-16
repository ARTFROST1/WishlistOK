import 'package:freezed_annotation/freezed_annotation.dart';
import 'wish.dart';

part 'wishlist.freezed.dart';
part 'wishlist.g.dart';

enum WishlistVisibility {
  @JsonValue('public')
  public,
  @JsonValue('link_only')
  linkOnly,
  @JsonValue('private')
  private,
}

@freezed
class Wishlist with _$Wishlist {
  const factory Wishlist({
    required int id,
    required String title,
    String? description,
    @JsonKey(name: 'event_date') DateTime? eventDate,
    required WishlistVisibility visibility,
    required String slug,
    @JsonKey(name: 'share_token') String? shareToken,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'wishes_count') @Default(0) int wishesCount,
    @JsonKey(name: 'available_wishes_count') @Default(0) int availableWishesCount,
    @JsonKey(name: 'claimed_wishes_count') @Default(0) int claimedWishesCount,
    @JsonKey(name: 'total_value') double? totalValue,
    @JsonKey(name: 'claimed_value') double? claimedValue,
    @JsonKey(name: 'share_url') String? shareUrl,
    @JsonKey(name: 'public_url') String? publicUrl,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    // Optional: include wishes when fetching details
    List<Wish>? wishes,
  }) = _Wishlist;

  factory Wishlist.fromJson(Map<String, dynamic> json) => _$WishlistFromJson(json);
}

@freezed
class WishlistsResponse with _$WishlistsResponse {
  const factory WishlistsResponse({
    required List<Wishlist> wishlists,
    required int total,
    @JsonKey(name: 'per_page') required int perPage,
    @JsonKey(name: 'current_page') required int currentPage,
    @JsonKey(name: 'total_pages') required int totalPages,
  }) = _WishlistsResponse;

  factory WishlistsResponse.fromJson(Map<String, dynamic> json) => _$WishlistsResponseFromJson(json);
}

@freezed
class CreateWishlistRequest with _$CreateWishlistRequest {
  const factory CreateWishlistRequest({
    required String title,
    String? description,
    @JsonKey(name: 'event_date') DateTime? eventDate,
    @Default(WishlistVisibility.linkOnly) WishlistVisibility visibility,
  }) = _CreateWishlistRequest;

  factory CreateWishlistRequest.fromJson(Map<String, dynamic> json) => _$CreateWishlistRequestFromJson(json);
}
