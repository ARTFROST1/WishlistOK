// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentImpl _$$PaymentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentImpl(
      id: (json['id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      status: $enumDecode(_$PaymentStatusEnumMap, json['status']),
      provider: $enumDecode(_$PaymentProviderEnumMap, json['provider']),
      paymentMethod: json['payment_method'] as String?,
      description: json['description'] as String?,
      formattedAmount: json['formatted_amount'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      confirmedAt: json['confirmed_at'] == null
          ? null
          : DateTime.parse(json['confirmed_at'] as String),
      confirmationUrl: json['confirmation_url'] as String?,
      receiptUrl: json['receipt_url'] as String?,
      canBeRefunded: json['can_be_refunded'] as bool? ?? false,
      isSuccessful: json['is_successful'] as bool? ?? false,
      contributor: json['contributor'] == null
          ? null
          : PaymentContributor.fromJson(
              json['contributor'] as Map<String, dynamic>),
      wish: json['wish'] == null
          ? null
          : PaymentWish.fromJson(json['wish'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaymentImplToJson(_$PaymentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'currency': instance.currency,
      'status': _$PaymentStatusEnumMap[instance.status]!,
      'provider': _$PaymentProviderEnumMap[instance.provider]!,
      'payment_method': instance.paymentMethod,
      'description': instance.description,
      'formatted_amount': instance.formattedAmount,
      'created_at': instance.createdAt?.toIso8601String(),
      'confirmed_at': instance.confirmedAt?.toIso8601String(),
      'confirmation_url': instance.confirmationUrl,
      'receipt_url': instance.receiptUrl,
      'can_be_refunded': instance.canBeRefunded,
      'is_successful': instance.isSuccessful,
      'contributor': instance.contributor,
      'wish': instance.wish,
    };

const _$PaymentStatusEnumMap = {
  PaymentStatus.pending: 'pending',
  PaymentStatus.processing: 'processing',
  PaymentStatus.succeeded: 'succeeded',
  PaymentStatus.failed: 'failed',
  PaymentStatus.cancelled: 'cancelled',
  PaymentStatus.refunded: 'refunded',
};

const _$PaymentProviderEnumMap = {
  PaymentProvider.yookassa: 'yookassa',
  PaymentProvider.cloudpayments: 'cloudpayments',
};

_$PaymentContributorImpl _$$PaymentContributorImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentContributorImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      avatarUrl: json['avatar_url'] as String?,
      isGuest: json['is_guest'] as bool? ?? false,
    );

Map<String, dynamic> _$$PaymentContributorImplToJson(
        _$PaymentContributorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
      'is_guest': instance.isGuest,
    };

_$PaymentWishImpl _$$PaymentWishImplFromJson(Map<String, dynamic> json) =>
    _$PaymentWishImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$PaymentWishImplToJson(_$PaymentWishImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image_url': instance.imageUrl,
    };

_$ContributionStatsImpl _$$ContributionStatsImplFromJson(
        Map<String, dynamic> json) =>
    _$ContributionStatsImpl(
      totalContributions: (json['total_contributions'] as num).toDouble(),
      targetPrice: (json['target_price'] as num?)?.toDouble(),
      progressPercentage: (json['progress_percentage'] as num).toDouble(),
      fullyFunded: json['fully_funded'] as bool? ?? false,
    );

Map<String, dynamic> _$$ContributionStatsImplToJson(
        _$ContributionStatsImpl instance) =>
    <String, dynamic>{
      'total_contributions': instance.totalContributions,
      'target_price': instance.targetPrice,
      'progress_percentage': instance.progressPercentage,
      'fully_funded': instance.fullyFunded,
    };

_$ContributionResponseImpl _$$ContributionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ContributionResponseImpl(
      contributions: (json['contributions'] as List<dynamic>)
          .map((e) => Payment.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: ContributionStats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContributionResponseImplToJson(
        _$ContributionResponseImpl instance) =>
    <String, dynamic>{
      'contributions': instance.contributions,
      'stats': instance.stats,
    };

_$CreatePaymentRequestImpl _$$CreatePaymentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreatePaymentRequestImpl(
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String? ?? 'RUB',
      paymentMethod: json['payment_method'] as String?,
    );

Map<String, dynamic> _$$CreatePaymentRequestImplToJson(
        _$CreatePaymentRequestImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
      'payment_method': instance.paymentMethod,
    };
