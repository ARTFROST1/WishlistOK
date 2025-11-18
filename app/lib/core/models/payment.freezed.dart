// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
mixin _$Payment {
  int get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  PaymentStatus get status => throw _privateConstructorUsedError;
  PaymentProvider get provider => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted_amount')
  String? get formattedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmed_at')
  DateTime? get confirmedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmation_url')
  String? get confirmationUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'receipt_url')
  String? get receiptUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'can_be_refunded')
  bool get canBeRefunded => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_successful')
  bool get isSuccessful =>
      throw _privateConstructorUsedError; // Contributor information (may be null if hidden)
  PaymentContributor? get contributor =>
      throw _privateConstructorUsedError; // Wish information
  PaymentWish? get wish => throw _privateConstructorUsedError;

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res, Payment>;
  @useResult
  $Res call(
      {int id,
      double amount,
      String currency,
      PaymentStatus status,
      PaymentProvider provider,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      String? description,
      @JsonKey(name: 'formatted_amount') String? formattedAmount,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
      @JsonKey(name: 'confirmation_url') String? confirmationUrl,
      @JsonKey(name: 'receipt_url') String? receiptUrl,
      @JsonKey(name: 'can_be_refunded') bool canBeRefunded,
      @JsonKey(name: 'is_successful') bool isSuccessful,
      PaymentContributor? contributor,
      PaymentWish? wish});

  $PaymentContributorCopyWith<$Res>? get contributor;
  $PaymentWishCopyWith<$Res>? get wish;
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res, $Val extends Payment>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? currency = null,
    Object? status = null,
    Object? provider = null,
    Object? paymentMethod = freezed,
    Object? description = freezed,
    Object? formattedAmount = freezed,
    Object? createdAt = freezed,
    Object? confirmedAt = freezed,
    Object? confirmationUrl = freezed,
    Object? receiptUrl = freezed,
    Object? canBeRefunded = null,
    Object? isSuccessful = null,
    Object? contributor = freezed,
    Object? wish = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as PaymentProvider,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      formattedAmount: freezed == formattedAmount
          ? _value.formattedAmount
          : formattedAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmedAt: freezed == confirmedAt
          ? _value.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmationUrl: freezed == confirmationUrl
          ? _value.confirmationUrl
          : confirmationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptUrl: freezed == receiptUrl
          ? _value.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      canBeRefunded: null == canBeRefunded
          ? _value.canBeRefunded
          : canBeRefunded // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      contributor: freezed == contributor
          ? _value.contributor
          : contributor // ignore: cast_nullable_to_non_nullable
              as PaymentContributor?,
      wish: freezed == wish
          ? _value.wish
          : wish // ignore: cast_nullable_to_non_nullable
              as PaymentWish?,
    ) as $Val);
  }

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentContributorCopyWith<$Res>? get contributor {
    if (_value.contributor == null) {
      return null;
    }

    return $PaymentContributorCopyWith<$Res>(_value.contributor!, (value) {
      return _then(_value.copyWith(contributor: value) as $Val);
    });
  }

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentWishCopyWith<$Res>? get wish {
    if (_value.wish == null) {
      return null;
    }

    return $PaymentWishCopyWith<$Res>(_value.wish!, (value) {
      return _then(_value.copyWith(wish: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentImplCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$$PaymentImplCopyWith(
          _$PaymentImpl value, $Res Function(_$PaymentImpl) then) =
      __$$PaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double amount,
      String currency,
      PaymentStatus status,
      PaymentProvider provider,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      String? description,
      @JsonKey(name: 'formatted_amount') String? formattedAmount,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
      @JsonKey(name: 'confirmation_url') String? confirmationUrl,
      @JsonKey(name: 'receipt_url') String? receiptUrl,
      @JsonKey(name: 'can_be_refunded') bool canBeRefunded,
      @JsonKey(name: 'is_successful') bool isSuccessful,
      PaymentContributor? contributor,
      PaymentWish? wish});

  @override
  $PaymentContributorCopyWith<$Res>? get contributor;
  @override
  $PaymentWishCopyWith<$Res>? get wish;
}

/// @nodoc
class __$$PaymentImplCopyWithImpl<$Res>
    extends _$PaymentCopyWithImpl<$Res, _$PaymentImpl>
    implements _$$PaymentImplCopyWith<$Res> {
  __$$PaymentImplCopyWithImpl(
      _$PaymentImpl _value, $Res Function(_$PaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? currency = null,
    Object? status = null,
    Object? provider = null,
    Object? paymentMethod = freezed,
    Object? description = freezed,
    Object? formattedAmount = freezed,
    Object? createdAt = freezed,
    Object? confirmedAt = freezed,
    Object? confirmationUrl = freezed,
    Object? receiptUrl = freezed,
    Object? canBeRefunded = null,
    Object? isSuccessful = null,
    Object? contributor = freezed,
    Object? wish = freezed,
  }) {
    return _then(_$PaymentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as PaymentProvider,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      formattedAmount: freezed == formattedAmount
          ? _value.formattedAmount
          : formattedAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmedAt: freezed == confirmedAt
          ? _value.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmationUrl: freezed == confirmationUrl
          ? _value.confirmationUrl
          : confirmationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptUrl: freezed == receiptUrl
          ? _value.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      canBeRefunded: null == canBeRefunded
          ? _value.canBeRefunded
          : canBeRefunded // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      contributor: freezed == contributor
          ? _value.contributor
          : contributor // ignore: cast_nullable_to_non_nullable
              as PaymentContributor?,
      wish: freezed == wish
          ? _value.wish
          : wish // ignore: cast_nullable_to_non_nullable
              as PaymentWish?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentImpl implements _Payment {
  const _$PaymentImpl(
      {required this.id,
      required this.amount,
      required this.currency,
      required this.status,
      required this.provider,
      @JsonKey(name: 'payment_method') this.paymentMethod,
      this.description,
      @JsonKey(name: 'formatted_amount') this.formattedAmount,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'confirmed_at') this.confirmedAt,
      @JsonKey(name: 'confirmation_url') this.confirmationUrl,
      @JsonKey(name: 'receipt_url') this.receiptUrl,
      @JsonKey(name: 'can_be_refunded') this.canBeRefunded = false,
      @JsonKey(name: 'is_successful') this.isSuccessful = false,
      this.contributor,
      this.wish});

  factory _$PaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentImplFromJson(json);

  @override
  final int id;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final PaymentStatus status;
  @override
  final PaymentProvider provider;
  @override
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  @override
  final String? description;
  @override
  @JsonKey(name: 'formatted_amount')
  final String? formattedAmount;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'confirmed_at')
  final DateTime? confirmedAt;
  @override
  @JsonKey(name: 'confirmation_url')
  final String? confirmationUrl;
  @override
  @JsonKey(name: 'receipt_url')
  final String? receiptUrl;
  @override
  @JsonKey(name: 'can_be_refunded')
  final bool canBeRefunded;
  @override
  @JsonKey(name: 'is_successful')
  final bool isSuccessful;
// Contributor information (may be null if hidden)
  @override
  final PaymentContributor? contributor;
// Wish information
  @override
  final PaymentWish? wish;

  @override
  String toString() {
    return 'Payment(id: $id, amount: $amount, currency: $currency, status: $status, provider: $provider, paymentMethod: $paymentMethod, description: $description, formattedAmount: $formattedAmount, createdAt: $createdAt, confirmedAt: $confirmedAt, confirmationUrl: $confirmationUrl, receiptUrl: $receiptUrl, canBeRefunded: $canBeRefunded, isSuccessful: $isSuccessful, contributor: $contributor, wish: $wish)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.formattedAmount, formattedAmount) ||
                other.formattedAmount == formattedAmount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.confirmedAt, confirmedAt) ||
                other.confirmedAt == confirmedAt) &&
            (identical(other.confirmationUrl, confirmationUrl) ||
                other.confirmationUrl == confirmationUrl) &&
            (identical(other.receiptUrl, receiptUrl) ||
                other.receiptUrl == receiptUrl) &&
            (identical(other.canBeRefunded, canBeRefunded) ||
                other.canBeRefunded == canBeRefunded) &&
            (identical(other.isSuccessful, isSuccessful) ||
                other.isSuccessful == isSuccessful) &&
            (identical(other.contributor, contributor) ||
                other.contributor == contributor) &&
            (identical(other.wish, wish) || other.wish == wish));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      amount,
      currency,
      status,
      provider,
      paymentMethod,
      description,
      formattedAmount,
      createdAt,
      confirmedAt,
      confirmationUrl,
      receiptUrl,
      canBeRefunded,
      isSuccessful,
      contributor,
      wish);

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      __$$PaymentImplCopyWithImpl<_$PaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentImplToJson(
      this,
    );
  }
}

abstract class _Payment implements Payment {
  const factory _Payment(
      {required final int id,
      required final double amount,
      required final String currency,
      required final PaymentStatus status,
      required final PaymentProvider provider,
      @JsonKey(name: 'payment_method') final String? paymentMethod,
      final String? description,
      @JsonKey(name: 'formatted_amount') final String? formattedAmount,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'confirmed_at') final DateTime? confirmedAt,
      @JsonKey(name: 'confirmation_url') final String? confirmationUrl,
      @JsonKey(name: 'receipt_url') final String? receiptUrl,
      @JsonKey(name: 'can_be_refunded') final bool canBeRefunded,
      @JsonKey(name: 'is_successful') final bool isSuccessful,
      final PaymentContributor? contributor,
      final PaymentWish? wish}) = _$PaymentImpl;

  factory _Payment.fromJson(Map<String, dynamic> json) = _$PaymentImpl.fromJson;

  @override
  int get id;
  @override
  double get amount;
  @override
  String get currency;
  @override
  PaymentStatus get status;
  @override
  PaymentProvider get provider;
  @override
  @JsonKey(name: 'payment_method')
  String? get paymentMethod;
  @override
  String? get description;
  @override
  @JsonKey(name: 'formatted_amount')
  String? get formattedAmount;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'confirmed_at')
  DateTime? get confirmedAt;
  @override
  @JsonKey(name: 'confirmation_url')
  String? get confirmationUrl;
  @override
  @JsonKey(name: 'receipt_url')
  String? get receiptUrl;
  @override
  @JsonKey(name: 'can_be_refunded')
  bool get canBeRefunded;
  @override
  @JsonKey(name: 'is_successful')
  bool get isSuccessful; // Contributor information (may be null if hidden)
  @override
  PaymentContributor? get contributor; // Wish information
  @override
  PaymentWish? get wish;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentContributor _$PaymentContributorFromJson(Map<String, dynamic> json) {
  return _PaymentContributor.fromJson(json);
}

/// @nodoc
mixin _$PaymentContributor {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_guest')
  bool get isGuest => throw _privateConstructorUsedError;

  /// Serializes this PaymentContributor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentContributor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentContributorCopyWith<PaymentContributor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentContributorCopyWith<$Res> {
  factory $PaymentContributorCopyWith(
          PaymentContributor value, $Res Function(PaymentContributor) then) =
      _$PaymentContributorCopyWithImpl<$Res, PaymentContributor>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'is_guest') bool isGuest});
}

/// @nodoc
class _$PaymentContributorCopyWithImpl<$Res, $Val extends PaymentContributor>
    implements $PaymentContributorCopyWith<$Res> {
  _$PaymentContributorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentContributor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarUrl = freezed,
    Object? isGuest = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isGuest: null == isGuest
          ? _value.isGuest
          : isGuest // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentContributorImplCopyWith<$Res>
    implements $PaymentContributorCopyWith<$Res> {
  factory _$$PaymentContributorImplCopyWith(_$PaymentContributorImpl value,
          $Res Function(_$PaymentContributorImpl) then) =
      __$$PaymentContributorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'is_guest') bool isGuest});
}

/// @nodoc
class __$$PaymentContributorImplCopyWithImpl<$Res>
    extends _$PaymentContributorCopyWithImpl<$Res, _$PaymentContributorImpl>
    implements _$$PaymentContributorImplCopyWith<$Res> {
  __$$PaymentContributorImplCopyWithImpl(_$PaymentContributorImpl _value,
      $Res Function(_$PaymentContributorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentContributor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarUrl = freezed,
    Object? isGuest = null,
  }) {
    return _then(_$PaymentContributorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isGuest: null == isGuest
          ? _value.isGuest
          : isGuest // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentContributorImpl implements _PaymentContributor {
  const _$PaymentContributorImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'is_guest') this.isGuest = false});

  factory _$PaymentContributorImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentContributorImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'is_guest')
  final bool isGuest;

  @override
  String toString() {
    return 'PaymentContributor(id: $id, name: $name, avatarUrl: $avatarUrl, isGuest: $isGuest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentContributorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.isGuest, isGuest) || other.isGuest == isGuest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatarUrl, isGuest);

  /// Create a copy of PaymentContributor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentContributorImplCopyWith<_$PaymentContributorImpl> get copyWith =>
      __$$PaymentContributorImplCopyWithImpl<_$PaymentContributorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentContributorImplToJson(
      this,
    );
  }
}

abstract class _PaymentContributor implements PaymentContributor {
  const factory _PaymentContributor(
          {required final int id,
          required final String name,
          @JsonKey(name: 'avatar_url') final String? avatarUrl,
          @JsonKey(name: 'is_guest') final bool isGuest}) =
      _$PaymentContributorImpl;

  factory _PaymentContributor.fromJson(Map<String, dynamic> json) =
      _$PaymentContributorImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'is_guest')
  bool get isGuest;

  /// Create a copy of PaymentContributor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentContributorImplCopyWith<_$PaymentContributorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentWish _$PaymentWishFromJson(Map<String, dynamic> json) {
  return _PaymentWish.fromJson(json);
}

/// @nodoc
mixin _$PaymentWish {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this PaymentWish to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentWish
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentWishCopyWith<PaymentWish> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentWishCopyWith<$Res> {
  factory $PaymentWishCopyWith(
          PaymentWish value, $Res Function(PaymentWish) then) =
      _$PaymentWishCopyWithImpl<$Res, PaymentWish>;
  @useResult
  $Res call(
      {int id, String title, @JsonKey(name: 'image_url') String? imageUrl});
}

/// @nodoc
class _$PaymentWishCopyWithImpl<$Res, $Val extends PaymentWish>
    implements $PaymentWishCopyWith<$Res> {
  _$PaymentWishCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentWish
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentWishImplCopyWith<$Res>
    implements $PaymentWishCopyWith<$Res> {
  factory _$$PaymentWishImplCopyWith(
          _$PaymentWishImpl value, $Res Function(_$PaymentWishImpl) then) =
      __$$PaymentWishImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String title, @JsonKey(name: 'image_url') String? imageUrl});
}

/// @nodoc
class __$$PaymentWishImplCopyWithImpl<$Res>
    extends _$PaymentWishCopyWithImpl<$Res, _$PaymentWishImpl>
    implements _$$PaymentWishImplCopyWith<$Res> {
  __$$PaymentWishImplCopyWithImpl(
      _$PaymentWishImpl _value, $Res Function(_$PaymentWishImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentWish
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$PaymentWishImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentWishImpl implements _PaymentWish {
  const _$PaymentWishImpl(
      {required this.id,
      required this.title,
      @JsonKey(name: 'image_url') this.imageUrl});

  factory _$PaymentWishImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentWishImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @override
  String toString() {
    return 'PaymentWish(id: $id, title: $title, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentWishImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, imageUrl);

  /// Create a copy of PaymentWish
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentWishImplCopyWith<_$PaymentWishImpl> get copyWith =>
      __$$PaymentWishImplCopyWithImpl<_$PaymentWishImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentWishImplToJson(
      this,
    );
  }
}

abstract class _PaymentWish implements PaymentWish {
  const factory _PaymentWish(
      {required final int id,
      required final String title,
      @JsonKey(name: 'image_url') final String? imageUrl}) = _$PaymentWishImpl;

  factory _PaymentWish.fromJson(Map<String, dynamic> json) =
      _$PaymentWishImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;

  /// Create a copy of PaymentWish
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentWishImplCopyWith<_$PaymentWishImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContributionStats _$ContributionStatsFromJson(Map<String, dynamic> json) {
  return _ContributionStats.fromJson(json);
}

/// @nodoc
mixin _$ContributionStats {
  @JsonKey(name: 'total_contributions')
  double get totalContributions => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_price')
  double? get targetPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'progress_percentage')
  double get progressPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'fully_funded')
  bool get fullyFunded => throw _privateConstructorUsedError;

  /// Serializes this ContributionStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContributionStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContributionStatsCopyWith<ContributionStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContributionStatsCopyWith<$Res> {
  factory $ContributionStatsCopyWith(
          ContributionStats value, $Res Function(ContributionStats) then) =
      _$ContributionStatsCopyWithImpl<$Res, ContributionStats>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_contributions') double totalContributions,
      @JsonKey(name: 'target_price') double? targetPrice,
      @JsonKey(name: 'progress_percentage') double progressPercentage,
      @JsonKey(name: 'fully_funded') bool fullyFunded});
}

/// @nodoc
class _$ContributionStatsCopyWithImpl<$Res, $Val extends ContributionStats>
    implements $ContributionStatsCopyWith<$Res> {
  _$ContributionStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContributionStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalContributions = null,
    Object? targetPrice = freezed,
    Object? progressPercentage = null,
    Object? fullyFunded = null,
  }) {
    return _then(_value.copyWith(
      totalContributions: null == totalContributions
          ? _value.totalContributions
          : totalContributions // ignore: cast_nullable_to_non_nullable
              as double,
      targetPrice: freezed == targetPrice
          ? _value.targetPrice
          : targetPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      progressPercentage: null == progressPercentage
          ? _value.progressPercentage
          : progressPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      fullyFunded: null == fullyFunded
          ? _value.fullyFunded
          : fullyFunded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContributionStatsImplCopyWith<$Res>
    implements $ContributionStatsCopyWith<$Res> {
  factory _$$ContributionStatsImplCopyWith(_$ContributionStatsImpl value,
          $Res Function(_$ContributionStatsImpl) then) =
      __$$ContributionStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_contributions') double totalContributions,
      @JsonKey(name: 'target_price') double? targetPrice,
      @JsonKey(name: 'progress_percentage') double progressPercentage,
      @JsonKey(name: 'fully_funded') bool fullyFunded});
}

/// @nodoc
class __$$ContributionStatsImplCopyWithImpl<$Res>
    extends _$ContributionStatsCopyWithImpl<$Res, _$ContributionStatsImpl>
    implements _$$ContributionStatsImplCopyWith<$Res> {
  __$$ContributionStatsImplCopyWithImpl(_$ContributionStatsImpl _value,
      $Res Function(_$ContributionStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContributionStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalContributions = null,
    Object? targetPrice = freezed,
    Object? progressPercentage = null,
    Object? fullyFunded = null,
  }) {
    return _then(_$ContributionStatsImpl(
      totalContributions: null == totalContributions
          ? _value.totalContributions
          : totalContributions // ignore: cast_nullable_to_non_nullable
              as double,
      targetPrice: freezed == targetPrice
          ? _value.targetPrice
          : targetPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      progressPercentage: null == progressPercentage
          ? _value.progressPercentage
          : progressPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      fullyFunded: null == fullyFunded
          ? _value.fullyFunded
          : fullyFunded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContributionStatsImpl implements _ContributionStats {
  const _$ContributionStatsImpl(
      {@JsonKey(name: 'total_contributions') required this.totalContributions,
      @JsonKey(name: 'target_price') this.targetPrice,
      @JsonKey(name: 'progress_percentage') required this.progressPercentage,
      @JsonKey(name: 'fully_funded') this.fullyFunded = false});

  factory _$ContributionStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContributionStatsImplFromJson(json);

  @override
  @JsonKey(name: 'total_contributions')
  final double totalContributions;
  @override
  @JsonKey(name: 'target_price')
  final double? targetPrice;
  @override
  @JsonKey(name: 'progress_percentage')
  final double progressPercentage;
  @override
  @JsonKey(name: 'fully_funded')
  final bool fullyFunded;

  @override
  String toString() {
    return 'ContributionStats(totalContributions: $totalContributions, targetPrice: $targetPrice, progressPercentage: $progressPercentage, fullyFunded: $fullyFunded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContributionStatsImpl &&
            (identical(other.totalContributions, totalContributions) ||
                other.totalContributions == totalContributions) &&
            (identical(other.targetPrice, targetPrice) ||
                other.targetPrice == targetPrice) &&
            (identical(other.progressPercentage, progressPercentage) ||
                other.progressPercentage == progressPercentage) &&
            (identical(other.fullyFunded, fullyFunded) ||
                other.fullyFunded == fullyFunded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalContributions, targetPrice,
      progressPercentage, fullyFunded);

  /// Create a copy of ContributionStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContributionStatsImplCopyWith<_$ContributionStatsImpl> get copyWith =>
      __$$ContributionStatsImplCopyWithImpl<_$ContributionStatsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContributionStatsImplToJson(
      this,
    );
  }
}

abstract class _ContributionStats implements ContributionStats {
  const factory _ContributionStats(
          {@JsonKey(name: 'total_contributions')
          required final double totalContributions,
          @JsonKey(name: 'target_price') final double? targetPrice,
          @JsonKey(name: 'progress_percentage')
          required final double progressPercentage,
          @JsonKey(name: 'fully_funded') final bool fullyFunded}) =
      _$ContributionStatsImpl;

  factory _ContributionStats.fromJson(Map<String, dynamic> json) =
      _$ContributionStatsImpl.fromJson;

  @override
  @JsonKey(name: 'total_contributions')
  double get totalContributions;
  @override
  @JsonKey(name: 'target_price')
  double? get targetPrice;
  @override
  @JsonKey(name: 'progress_percentage')
  double get progressPercentage;
  @override
  @JsonKey(name: 'fully_funded')
  bool get fullyFunded;

  /// Create a copy of ContributionStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContributionStatsImplCopyWith<_$ContributionStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContributionResponse _$ContributionResponseFromJson(Map<String, dynamic> json) {
  return _ContributionResponse.fromJson(json);
}

/// @nodoc
mixin _$ContributionResponse {
  List<Payment> get contributions => throw _privateConstructorUsedError;
  ContributionStats get stats => throw _privateConstructorUsedError;

  /// Serializes this ContributionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContributionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContributionResponseCopyWith<ContributionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContributionResponseCopyWith<$Res> {
  factory $ContributionResponseCopyWith(ContributionResponse value,
          $Res Function(ContributionResponse) then) =
      _$ContributionResponseCopyWithImpl<$Res, ContributionResponse>;
  @useResult
  $Res call({List<Payment> contributions, ContributionStats stats});

  $ContributionStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$ContributionResponseCopyWithImpl<$Res,
        $Val extends ContributionResponse>
    implements $ContributionResponseCopyWith<$Res> {
  _$ContributionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContributionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contributions = null,
    Object? stats = null,
  }) {
    return _then(_value.copyWith(
      contributions: null == contributions
          ? _value.contributions
          : contributions // ignore: cast_nullable_to_non_nullable
              as List<Payment>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as ContributionStats,
    ) as $Val);
  }

  /// Create a copy of ContributionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContributionStatsCopyWith<$Res> get stats {
    return $ContributionStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContributionResponseImplCopyWith<$Res>
    implements $ContributionResponseCopyWith<$Res> {
  factory _$$ContributionResponseImplCopyWith(_$ContributionResponseImpl value,
          $Res Function(_$ContributionResponseImpl) then) =
      __$$ContributionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Payment> contributions, ContributionStats stats});

  @override
  $ContributionStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$ContributionResponseImplCopyWithImpl<$Res>
    extends _$ContributionResponseCopyWithImpl<$Res, _$ContributionResponseImpl>
    implements _$$ContributionResponseImplCopyWith<$Res> {
  __$$ContributionResponseImplCopyWithImpl(_$ContributionResponseImpl _value,
      $Res Function(_$ContributionResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContributionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contributions = null,
    Object? stats = null,
  }) {
    return _then(_$ContributionResponseImpl(
      contributions: null == contributions
          ? _value._contributions
          : contributions // ignore: cast_nullable_to_non_nullable
              as List<Payment>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as ContributionStats,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContributionResponseImpl implements _ContributionResponse {
  const _$ContributionResponseImpl(
      {required final List<Payment> contributions, required this.stats})
      : _contributions = contributions;

  factory _$ContributionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContributionResponseImplFromJson(json);

  final List<Payment> _contributions;
  @override
  List<Payment> get contributions {
    if (_contributions is EqualUnmodifiableListView) return _contributions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contributions);
  }

  @override
  final ContributionStats stats;

  @override
  String toString() {
    return 'ContributionResponse(contributions: $contributions, stats: $stats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContributionResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._contributions, _contributions) &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_contributions), stats);

  /// Create a copy of ContributionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContributionResponseImplCopyWith<_$ContributionResponseImpl>
      get copyWith =>
          __$$ContributionResponseImplCopyWithImpl<_$ContributionResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContributionResponseImplToJson(
      this,
    );
  }
}

abstract class _ContributionResponse implements ContributionResponse {
  const factory _ContributionResponse(
      {required final List<Payment> contributions,
      required final ContributionStats stats}) = _$ContributionResponseImpl;

  factory _ContributionResponse.fromJson(Map<String, dynamic> json) =
      _$ContributionResponseImpl.fromJson;

  @override
  List<Payment> get contributions;
  @override
  ContributionStats get stats;

  /// Create a copy of ContributionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContributionResponseImplCopyWith<_$ContributionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreatePaymentRequest _$CreatePaymentRequestFromJson(Map<String, dynamic> json) {
  return _CreatePaymentRequest.fromJson(json);
}

/// @nodoc
mixin _$CreatePaymentRequest {
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String? get paymentMethod => throw _privateConstructorUsedError;

  /// Serializes this CreatePaymentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatePaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePaymentRequestCopyWith<CreatePaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePaymentRequestCopyWith<$Res> {
  factory $CreatePaymentRequestCopyWith(CreatePaymentRequest value,
          $Res Function(CreatePaymentRequest) then) =
      _$CreatePaymentRequestCopyWithImpl<$Res, CreatePaymentRequest>;
  @useResult
  $Res call(
      {double amount,
      String currency,
      @JsonKey(name: 'payment_method') String? paymentMethod});
}

/// @nodoc
class _$CreatePaymentRequestCopyWithImpl<$Res,
        $Val extends CreatePaymentRequest>
    implements $CreatePaymentRequestCopyWith<$Res> {
  _$CreatePaymentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? currency = null,
    Object? paymentMethod = freezed,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatePaymentRequestImplCopyWith<$Res>
    implements $CreatePaymentRequestCopyWith<$Res> {
  factory _$$CreatePaymentRequestImplCopyWith(_$CreatePaymentRequestImpl value,
          $Res Function(_$CreatePaymentRequestImpl) then) =
      __$$CreatePaymentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double amount,
      String currency,
      @JsonKey(name: 'payment_method') String? paymentMethod});
}

/// @nodoc
class __$$CreatePaymentRequestImplCopyWithImpl<$Res>
    extends _$CreatePaymentRequestCopyWithImpl<$Res, _$CreatePaymentRequestImpl>
    implements _$$CreatePaymentRequestImplCopyWith<$Res> {
  __$$CreatePaymentRequestImplCopyWithImpl(_$CreatePaymentRequestImpl _value,
      $Res Function(_$CreatePaymentRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatePaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? currency = null,
    Object? paymentMethod = freezed,
  }) {
    return _then(_$CreatePaymentRequestImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePaymentRequestImpl implements _CreatePaymentRequest {
  const _$CreatePaymentRequestImpl(
      {required this.amount,
      this.currency = 'RUB',
      @JsonKey(name: 'payment_method') this.paymentMethod});

  factory _$CreatePaymentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePaymentRequestImplFromJson(json);

  @override
  final double amount;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;

  @override
  String toString() {
    return 'CreatePaymentRequest(amount: $amount, currency: $currency, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePaymentRequestImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, currency, paymentMethod);

  /// Create a copy of CreatePaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePaymentRequestImplCopyWith<_$CreatePaymentRequestImpl>
      get copyWith =>
          __$$CreatePaymentRequestImplCopyWithImpl<_$CreatePaymentRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePaymentRequestImplToJson(
      this,
    );
  }
}

abstract class _CreatePaymentRequest implements CreatePaymentRequest {
  const factory _CreatePaymentRequest(
          {required final double amount,
          final String currency,
          @JsonKey(name: 'payment_method') final String? paymentMethod}) =
      _$CreatePaymentRequestImpl;

  factory _CreatePaymentRequest.fromJson(Map<String, dynamic> json) =
      _$CreatePaymentRequestImpl.fromJson;

  @override
  double get amount;
  @override
  String get currency;
  @override
  @JsonKey(name: 'payment_method')
  String? get paymentMethod;

  /// Create a copy of CreatePaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePaymentRequestImplCopyWith<_$CreatePaymentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
