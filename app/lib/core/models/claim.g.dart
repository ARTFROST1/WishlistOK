// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClaimImpl _$$ClaimImplFromJson(Map<String, dynamic> json) => _$ClaimImpl(
      id: (json['id'] as num).toInt(),
      wishId: (json['wish_id'] as num).toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      guestId: json['guest_id'] as String?,
      claimedAt: DateTime.parse(json['claimed_at'] as String),
      purchasedAt: json['purchased_at'] == null
          ? null
          : DateTime.parse(json['purchased_at'] as String),
      contributionAmount: (json['contribution_amount'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      wish: json['wish'] == null
          ? null
          : Wish.fromJson(json['wish'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ClaimImplToJson(_$ClaimImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wish_id': instance.wishId,
      'user_id': instance.userId,
      'guest_id': instance.guestId,
      'claimed_at': instance.claimedAt.toIso8601String(),
      'purchased_at': instance.purchasedAt?.toIso8601String(),
      'contribution_amount': instance.contributionAmount,
      'notes': instance.notes,
      'wish': instance.wish,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$ClaimRequestImpl _$$ClaimRequestImplFromJson(Map<String, dynamic> json) =>
    _$ClaimRequestImpl(
      wishId: (json['wish_id'] as num).toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$ClaimRequestImplToJson(_$ClaimRequestImpl instance) =>
    <String, dynamic>{
      'wish_id': instance.wishId,
      'notes': instance.notes,
    };

_$ClaimResponseImpl _$$ClaimResponseImplFromJson(Map<String, dynamic> json) =>
    _$ClaimResponseImpl(
      claim: Claim.fromJson(json['claim'] as Map<String, dynamic>),
      message: json['message'] as String,
      success: json['success'] as bool? ?? true,
    );

Map<String, dynamic> _$$ClaimResponseImplToJson(_$ClaimResponseImpl instance) =>
    <String, dynamic>{
      'claim': instance.claim,
      'message': instance.message,
      'success': instance.success,
    };
