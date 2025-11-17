import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

enum PaymentStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('processing')
  processing,
  @JsonValue('succeeded')
  succeeded,
  @JsonValue('failed')
  failed,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('refunded')
  refunded,
}

enum PaymentProvider {
  @JsonValue('yookassa')
  yookassa,
  @JsonValue('cloudpayments')
  cloudpayments,
}

@freezed
class Payment with _$Payment {
  const factory Payment({
    required int id,
    required double amount,
    required String currency,
    required PaymentStatus status,
    required PaymentProvider provider,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    String? description,
    @JsonKey(name: 'formatted_amount') String? formattedAmount,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
    @JsonKey(name: 'confirmation_url') String? confirmationUrl,
    @JsonKey(name: 'receipt_url') String? receiptUrl,
    @JsonKey(name: 'can_be_refunded') @Default(false) bool canBeRefunded,
    @JsonKey(name: 'is_successful') @Default(false) bool isSuccessful,
    // Contributor information (may be null if hidden)
    PaymentContributor? contributor,
    // Wish information
    PaymentWish? wish,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);
}

@freezed
class PaymentContributor with _$PaymentContributor {
  const factory PaymentContributor({
    required int id,
    required String name,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'is_guest') @Default(false) bool isGuest,
  }) = _PaymentContributor;

  factory PaymentContributor.fromJson(Map<String, dynamic> json) =>
      _$PaymentContributorFromJson(json);
}

@freezed
class PaymentWish with _$PaymentWish {
  const factory PaymentWish({
    required int id,
    required String title,
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _PaymentWish;

  factory PaymentWish.fromJson(Map<String, dynamic> json) =>
      _$PaymentWishFromJson(json);
}

@freezed
class ContributionStats with _$ContributionStats {
  const factory ContributionStats({
    @JsonKey(name: 'total_contributions') required double totalContributions,
    @JsonKey(name: 'target_price') double? targetPrice,
    @JsonKey(name: 'progress_percentage') required double progressPercentage,
    @JsonKey(name: 'fully_funded') @Default(false) bool fullyFunded,
  }) = _ContributionStats;

  factory ContributionStats.fromJson(Map<String, dynamic> json) =>
      _$ContributionStatsFromJson(json);
}

@freezed
class ContributionResponse with _$ContributionResponse {
  const factory ContributionResponse({
    required List<Payment> contributions,
    required ContributionStats stats,
  }) = _ContributionResponse;

  factory ContributionResponse.fromJson(Map<String, dynamic> json) =>
      _$ContributionResponseFromJson(json);
}

@freezed
class CreatePaymentRequest with _$CreatePaymentRequest {
  const factory CreatePaymentRequest({
    required double amount,
    @Default('RUB') String currency,
    @JsonKey(name: 'payment_method') String? paymentMethod,
  }) = _CreatePaymentRequest;

  factory CreatePaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePaymentRequestFromJson(json);

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'currency': currency,
      if (paymentMethod != null) 'payment_method': paymentMethod,
    };
  }
}
