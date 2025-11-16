import 'package:freezed_annotation/freezed_annotation.dart';
import 'wish.dart';

part 'claim.freezed.dart';
part 'claim.g.dart';

@freezed
class Claim with _$Claim {
  const factory Claim({
    required int id,
    @JsonKey(name: 'wish_id') required int wishId,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'guest_id') String? guestId,
    @JsonKey(name: 'claimed_at') required DateTime claimedAt,
    @JsonKey(name: 'purchased_at') DateTime? purchasedAt,
    @JsonKey(name: 'contribution_amount') double? contributionAmount,
    String? notes,
    // Relations
    Wish? wish,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Claim;

  factory Claim.fromJson(Map<String, dynamic> json) => _$ClaimFromJson(json);
}

@freezed
class ClaimRequest with _$ClaimRequest {
  const factory ClaimRequest({
    @JsonKey(name: 'wish_id') required int wishId,
    String? notes,
  }) = _ClaimRequest;

  factory ClaimRequest.fromJson(Map<String, dynamic> json) => _$ClaimRequestFromJson(json);
}

@freezed
class ClaimResponse with _$ClaimResponse {
  const factory ClaimResponse({
    required Claim claim,
    required String message,
    @Default(true) bool success,
  }) = _ClaimResponse;

  factory ClaimResponse.fromJson(Map<String, dynamic> json) => _$ClaimResponseFromJson(json);
}
