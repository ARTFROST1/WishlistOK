// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wish.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Wish _$WishFromJson(Map<String, dynamic> json) {
  return _Wish.fromJson(json);
}

/// @nodoc
mixin _$Wish {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_url')
  String? get productUrl => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  WishStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'wishlist_id')
  int get wishlistId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'claimed_by')
  int? get claimedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'claimed_at')
  DateTime? get claimedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchased_at')
  DateTime? get purchasedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt =>
      throw _privateConstructorUsedError; // Computed fields
  @JsonKey(name: 'can_claim')
  bool get canClaim => throw _privateConstructorUsedError;
  @JsonKey(name: 'can_edit')
  bool get canEdit => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_claimed_by_me')
  bool get isClaimedByMe => throw _privateConstructorUsedError;

  /// Serializes this Wish to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Wish
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WishCopyWith<Wish> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishCopyWith<$Res> {
  factory $WishCopyWith(Wish value, $Res Function(Wish) then) =
      _$WishCopyWithImpl<$Res, Wish>;
  @useResult
  $Res call(
      {int id,
      String title,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'product_url') String? productUrl,
      double? price,
      String? currency,
      WishStatus status,
      @JsonKey(name: 'wishlist_id') int wishlistId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'claimed_by') int? claimedBy,
      @JsonKey(name: 'claimed_at') DateTime? claimedAt,
      @JsonKey(name: 'purchased_at') DateTime? purchasedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'can_claim') bool canClaim,
      @JsonKey(name: 'can_edit') bool canEdit,
      @JsonKey(name: 'is_claimed_by_me') bool isClaimedByMe});
}

/// @nodoc
class _$WishCopyWithImpl<$Res, $Val extends Wish>
    implements $WishCopyWith<$Res> {
  _$WishCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Wish
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? productUrl = freezed,
    Object? price = freezed,
    Object? currency = freezed,
    Object? status = null,
    Object? wishlistId = null,
    Object? userId = null,
    Object? claimedBy = freezed,
    Object? claimedAt = freezed,
    Object? purchasedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? canClaim = null,
    Object? canEdit = null,
    Object? isClaimedByMe = null,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      productUrl: freezed == productUrl
          ? _value.productUrl
          : productUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WishStatus,
      wishlistId: null == wishlistId
          ? _value.wishlistId
          : wishlistId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      claimedBy: freezed == claimedBy
          ? _value.claimedBy
          : claimedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      claimedAt: freezed == claimedAt
          ? _value.claimedAt
          : claimedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      purchasedAt: freezed == purchasedAt
          ? _value.purchasedAt
          : purchasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      canClaim: null == canClaim
          ? _value.canClaim
          : canClaim // ignore: cast_nullable_to_non_nullable
              as bool,
      canEdit: null == canEdit
          ? _value.canEdit
          : canEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      isClaimedByMe: null == isClaimedByMe
          ? _value.isClaimedByMe
          : isClaimedByMe // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WishImplCopyWith<$Res> implements $WishCopyWith<$Res> {
  factory _$$WishImplCopyWith(
          _$WishImpl value, $Res Function(_$WishImpl) then) =
      __$$WishImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'product_url') String? productUrl,
      double? price,
      String? currency,
      WishStatus status,
      @JsonKey(name: 'wishlist_id') int wishlistId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'claimed_by') int? claimedBy,
      @JsonKey(name: 'claimed_at') DateTime? claimedAt,
      @JsonKey(name: 'purchased_at') DateTime? purchasedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'can_claim') bool canClaim,
      @JsonKey(name: 'can_edit') bool canEdit,
      @JsonKey(name: 'is_claimed_by_me') bool isClaimedByMe});
}

/// @nodoc
class __$$WishImplCopyWithImpl<$Res>
    extends _$WishCopyWithImpl<$Res, _$WishImpl>
    implements _$$WishImplCopyWith<$Res> {
  __$$WishImplCopyWithImpl(_$WishImpl _value, $Res Function(_$WishImpl) _then)
      : super(_value, _then);

  /// Create a copy of Wish
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? productUrl = freezed,
    Object? price = freezed,
    Object? currency = freezed,
    Object? status = null,
    Object? wishlistId = null,
    Object? userId = null,
    Object? claimedBy = freezed,
    Object? claimedAt = freezed,
    Object? purchasedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? canClaim = null,
    Object? canEdit = null,
    Object? isClaimedByMe = null,
  }) {
    return _then(_$WishImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      productUrl: freezed == productUrl
          ? _value.productUrl
          : productUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WishStatus,
      wishlistId: null == wishlistId
          ? _value.wishlistId
          : wishlistId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      claimedBy: freezed == claimedBy
          ? _value.claimedBy
          : claimedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      claimedAt: freezed == claimedAt
          ? _value.claimedAt
          : claimedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      purchasedAt: freezed == purchasedAt
          ? _value.purchasedAt
          : purchasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      canClaim: null == canClaim
          ? _value.canClaim
          : canClaim // ignore: cast_nullable_to_non_nullable
              as bool,
      canEdit: null == canEdit
          ? _value.canEdit
          : canEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      isClaimedByMe: null == isClaimedByMe
          ? _value.isClaimedByMe
          : isClaimedByMe // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WishImpl implements _Wish {
  const _$WishImpl(
      {required this.id,
      required this.title,
      this.description,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'product_url') this.productUrl,
      this.price,
      this.currency,
      required this.status,
      @JsonKey(name: 'wishlist_id') required this.wishlistId,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'claimed_by') this.claimedBy,
      @JsonKey(name: 'claimed_at') this.claimedAt,
      @JsonKey(name: 'purchased_at') this.purchasedAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'can_claim') this.canClaim = true,
      @JsonKey(name: 'can_edit') this.canEdit = false,
      @JsonKey(name: 'is_claimed_by_me') this.isClaimedByMe = false});

  factory _$WishImpl.fromJson(Map<String, dynamic> json) =>
      _$$WishImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String? description;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'product_url')
  final String? productUrl;
  @override
  final double? price;
  @override
  final String? currency;
  @override
  final WishStatus status;
  @override
  @JsonKey(name: 'wishlist_id')
  final int wishlistId;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'claimed_by')
  final int? claimedBy;
  @override
  @JsonKey(name: 'claimed_at')
  final DateTime? claimedAt;
  @override
  @JsonKey(name: 'purchased_at')
  final DateTime? purchasedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
// Computed fields
  @override
  @JsonKey(name: 'can_claim')
  final bool canClaim;
  @override
  @JsonKey(name: 'can_edit')
  final bool canEdit;
  @override
  @JsonKey(name: 'is_claimed_by_me')
  final bool isClaimedByMe;

  @override
  String toString() {
    return 'Wish(id: $id, title: $title, description: $description, imageUrl: $imageUrl, productUrl: $productUrl, price: $price, currency: $currency, status: $status, wishlistId: $wishlistId, userId: $userId, claimedBy: $claimedBy, claimedAt: $claimedAt, purchasedAt: $purchasedAt, createdAt: $createdAt, updatedAt: $updatedAt, canClaim: $canClaim, canEdit: $canEdit, isClaimedByMe: $isClaimedByMe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WishImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.productUrl, productUrl) ||
                other.productUrl == productUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.wishlistId, wishlistId) ||
                other.wishlistId == wishlistId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.claimedBy, claimedBy) ||
                other.claimedBy == claimedBy) &&
            (identical(other.claimedAt, claimedAt) ||
                other.claimedAt == claimedAt) &&
            (identical(other.purchasedAt, purchasedAt) ||
                other.purchasedAt == purchasedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.canClaim, canClaim) ||
                other.canClaim == canClaim) &&
            (identical(other.canEdit, canEdit) || other.canEdit == canEdit) &&
            (identical(other.isClaimedByMe, isClaimedByMe) ||
                other.isClaimedByMe == isClaimedByMe));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      imageUrl,
      productUrl,
      price,
      currency,
      status,
      wishlistId,
      userId,
      claimedBy,
      claimedAt,
      purchasedAt,
      createdAt,
      updatedAt,
      canClaim,
      canEdit,
      isClaimedByMe);

  /// Create a copy of Wish
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WishImplCopyWith<_$WishImpl> get copyWith =>
      __$$WishImplCopyWithImpl<_$WishImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WishImplToJson(
      this,
    );
  }
}

abstract class _Wish implements Wish {
  const factory _Wish(
          {required final int id,
          required final String title,
          final String? description,
          @JsonKey(name: 'image_url') final String? imageUrl,
          @JsonKey(name: 'product_url') final String? productUrl,
          final double? price,
          final String? currency,
          required final WishStatus status,
          @JsonKey(name: 'wishlist_id') required final int wishlistId,
          @JsonKey(name: 'user_id') required final int userId,
          @JsonKey(name: 'claimed_by') final int? claimedBy,
          @JsonKey(name: 'claimed_at') final DateTime? claimedAt,
          @JsonKey(name: 'purchased_at') final DateTime? purchasedAt,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt,
          @JsonKey(name: 'can_claim') final bool canClaim,
          @JsonKey(name: 'can_edit') final bool canEdit,
          @JsonKey(name: 'is_claimed_by_me') final bool isClaimedByMe}) =
      _$WishImpl;

  factory _Wish.fromJson(Map<String, dynamic> json) = _$WishImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'product_url')
  String? get productUrl;
  @override
  double? get price;
  @override
  String? get currency;
  @override
  WishStatus get status;
  @override
  @JsonKey(name: 'wishlist_id')
  int get wishlistId;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'claimed_by')
  int? get claimedBy;
  @override
  @JsonKey(name: 'claimed_at')
  DateTime? get claimedAt;
  @override
  @JsonKey(name: 'purchased_at')
  DateTime? get purchasedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt; // Computed fields
  @override
  @JsonKey(name: 'can_claim')
  bool get canClaim;
  @override
  @JsonKey(name: 'can_edit')
  bool get canEdit;
  @override
  @JsonKey(name: 'is_claimed_by_me')
  bool get isClaimedByMe;

  /// Create a copy of Wish
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WishImplCopyWith<_$WishImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ParseWishRequest _$ParseWishRequestFromJson(Map<String, dynamic> json) {
  return _ParseWishRequest.fromJson(json);
}

/// @nodoc
mixin _$ParseWishRequest {
  String get url => throw _privateConstructorUsedError;

  /// Serializes this ParseWishRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ParseWishRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParseWishRequestCopyWith<ParseWishRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParseWishRequestCopyWith<$Res> {
  factory $ParseWishRequestCopyWith(
          ParseWishRequest value, $Res Function(ParseWishRequest) then) =
      _$ParseWishRequestCopyWithImpl<$Res, ParseWishRequest>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$ParseWishRequestCopyWithImpl<$Res, $Val extends ParseWishRequest>
    implements $ParseWishRequestCopyWith<$Res> {
  _$ParseWishRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParseWishRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParseWishRequestImplCopyWith<$Res>
    implements $ParseWishRequestCopyWith<$Res> {
  factory _$$ParseWishRequestImplCopyWith(_$ParseWishRequestImpl value,
          $Res Function(_$ParseWishRequestImpl) then) =
      __$$ParseWishRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$ParseWishRequestImplCopyWithImpl<$Res>
    extends _$ParseWishRequestCopyWithImpl<$Res, _$ParseWishRequestImpl>
    implements _$$ParseWishRequestImplCopyWith<$Res> {
  __$$ParseWishRequestImplCopyWithImpl(_$ParseWishRequestImpl _value,
      $Res Function(_$ParseWishRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParseWishRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$ParseWishRequestImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParseWishRequestImpl implements _ParseWishRequest {
  const _$ParseWishRequestImpl({required this.url});

  factory _$ParseWishRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParseWishRequestImplFromJson(json);

  @override
  final String url;

  @override
  String toString() {
    return 'ParseWishRequest(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParseWishRequestImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  /// Create a copy of ParseWishRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParseWishRequestImplCopyWith<_$ParseWishRequestImpl> get copyWith =>
      __$$ParseWishRequestImplCopyWithImpl<_$ParseWishRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParseWishRequestImplToJson(
      this,
    );
  }
}

abstract class _ParseWishRequest implements ParseWishRequest {
  const factory _ParseWishRequest({required final String url}) =
      _$ParseWishRequestImpl;

  factory _ParseWishRequest.fromJson(Map<String, dynamic> json) =
      _$ParseWishRequestImpl.fromJson;

  @override
  String get url;

  /// Create a copy of ParseWishRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParseWishRequestImplCopyWith<_$ParseWishRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ParseWishResponse _$ParseWishResponseFromJson(Map<String, dynamic> json) {
  return _ParseWishResponse.fromJson(json);
}

/// @nodoc
mixin _$ParseWishResponse {
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_url')
  String get productUrl => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this ParseWishResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ParseWishResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParseWishResponseCopyWith<ParseWishResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParseWishResponseCopyWith<$Res> {
  factory $ParseWishResponseCopyWith(
          ParseWishResponse value, $Res Function(ParseWishResponse) then) =
      _$ParseWishResponseCopyWithImpl<$Res, ParseWishResponse>;
  @useResult
  $Res call(
      {String title,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'product_url') String productUrl,
      double? price,
      String? currency,
      bool success,
      String? error});
}

/// @nodoc
class _$ParseWishResponseCopyWithImpl<$Res, $Val extends ParseWishResponse>
    implements $ParseWishResponseCopyWith<$Res> {
  _$ParseWishResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParseWishResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? productUrl = null,
    Object? price = freezed,
    Object? currency = freezed,
    Object? success = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      productUrl: null == productUrl
          ? _value.productUrl
          : productUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParseWishResponseImplCopyWith<$Res>
    implements $ParseWishResponseCopyWith<$Res> {
  factory _$$ParseWishResponseImplCopyWith(_$ParseWishResponseImpl value,
          $Res Function(_$ParseWishResponseImpl) then) =
      __$$ParseWishResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'product_url') String productUrl,
      double? price,
      String? currency,
      bool success,
      String? error});
}

/// @nodoc
class __$$ParseWishResponseImplCopyWithImpl<$Res>
    extends _$ParseWishResponseCopyWithImpl<$Res, _$ParseWishResponseImpl>
    implements _$$ParseWishResponseImplCopyWith<$Res> {
  __$$ParseWishResponseImplCopyWithImpl(_$ParseWishResponseImpl _value,
      $Res Function(_$ParseWishResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParseWishResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? productUrl = null,
    Object? price = freezed,
    Object? currency = freezed,
    Object? success = null,
    Object? error = freezed,
  }) {
    return _then(_$ParseWishResponseImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      productUrl: null == productUrl
          ? _value.productUrl
          : productUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParseWishResponseImpl implements _ParseWishResponse {
  const _$ParseWishResponseImpl(
      {required this.title,
      this.description,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'product_url') required this.productUrl,
      this.price,
      this.currency,
      this.success = true,
      this.error});

  factory _$ParseWishResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParseWishResponseImplFromJson(json);

  @override
  final String title;
  @override
  final String? description;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'product_url')
  final String productUrl;
  @override
  final double? price;
  @override
  final String? currency;
  @override
  @JsonKey()
  final bool success;
  @override
  final String? error;

  @override
  String toString() {
    return 'ParseWishResponse(title: $title, description: $description, imageUrl: $imageUrl, productUrl: $productUrl, price: $price, currency: $currency, success: $success, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParseWishResponseImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.productUrl, productUrl) ||
                other.productUrl == productUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, imageUrl,
      productUrl, price, currency, success, error);

  /// Create a copy of ParseWishResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParseWishResponseImplCopyWith<_$ParseWishResponseImpl> get copyWith =>
      __$$ParseWishResponseImplCopyWithImpl<_$ParseWishResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParseWishResponseImplToJson(
      this,
    );
  }
}

abstract class _ParseWishResponse implements ParseWishResponse {
  const factory _ParseWishResponse(
      {required final String title,
      final String? description,
      @JsonKey(name: 'image_url') final String? imageUrl,
      @JsonKey(name: 'product_url') required final String productUrl,
      final double? price,
      final String? currency,
      final bool success,
      final String? error}) = _$ParseWishResponseImpl;

  factory _ParseWishResponse.fromJson(Map<String, dynamic> json) =
      _$ParseWishResponseImpl.fromJson;

  @override
  String get title;
  @override
  String? get description;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'product_url')
  String get productUrl;
  @override
  double? get price;
  @override
  String? get currency;
  @override
  bool get success;
  @override
  String? get error;

  /// Create a copy of ParseWishResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParseWishResponseImplCopyWith<_$ParseWishResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateWishRequest _$CreateWishRequestFromJson(Map<String, dynamic> json) {
  return _CreateWishRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateWishRequest {
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_url')
  String? get productUrl => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'wishlist_id')
  int get wishlistId => throw _privateConstructorUsedError;

  /// Serializes this CreateWishRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateWishRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateWishRequestCopyWith<CreateWishRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateWishRequestCopyWith<$Res> {
  factory $CreateWishRequestCopyWith(
          CreateWishRequest value, $Res Function(CreateWishRequest) then) =
      _$CreateWishRequestCopyWithImpl<$Res, CreateWishRequest>;
  @useResult
  $Res call(
      {String title,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'product_url') String? productUrl,
      double? price,
      String? currency,
      @JsonKey(name: 'wishlist_id') int wishlistId});
}

/// @nodoc
class _$CreateWishRequestCopyWithImpl<$Res, $Val extends CreateWishRequest>
    implements $CreateWishRequestCopyWith<$Res> {
  _$CreateWishRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateWishRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? productUrl = freezed,
    Object? price = freezed,
    Object? currency = freezed,
    Object? wishlistId = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      productUrl: freezed == productUrl
          ? _value.productUrl
          : productUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      wishlistId: null == wishlistId
          ? _value.wishlistId
          : wishlistId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateWishRequestImplCopyWith<$Res>
    implements $CreateWishRequestCopyWith<$Res> {
  factory _$$CreateWishRequestImplCopyWith(_$CreateWishRequestImpl value,
          $Res Function(_$CreateWishRequestImpl) then) =
      __$$CreateWishRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'product_url') String? productUrl,
      double? price,
      String? currency,
      @JsonKey(name: 'wishlist_id') int wishlistId});
}

/// @nodoc
class __$$CreateWishRequestImplCopyWithImpl<$Res>
    extends _$CreateWishRequestCopyWithImpl<$Res, _$CreateWishRequestImpl>
    implements _$$CreateWishRequestImplCopyWith<$Res> {
  __$$CreateWishRequestImplCopyWithImpl(_$CreateWishRequestImpl _value,
      $Res Function(_$CreateWishRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateWishRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? productUrl = freezed,
    Object? price = freezed,
    Object? currency = freezed,
    Object? wishlistId = null,
  }) {
    return _then(_$CreateWishRequestImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      productUrl: freezed == productUrl
          ? _value.productUrl
          : productUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      wishlistId: null == wishlistId
          ? _value.wishlistId
          : wishlistId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateWishRequestImpl implements _CreateWishRequest {
  const _$CreateWishRequestImpl(
      {required this.title,
      this.description,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'product_url') this.productUrl,
      this.price,
      this.currency,
      @JsonKey(name: 'wishlist_id') required this.wishlistId});

  factory _$CreateWishRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateWishRequestImplFromJson(json);

  @override
  final String title;
  @override
  final String? description;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'product_url')
  final String? productUrl;
  @override
  final double? price;
  @override
  final String? currency;
  @override
  @JsonKey(name: 'wishlist_id')
  final int wishlistId;

  @override
  String toString() {
    return 'CreateWishRequest(title: $title, description: $description, imageUrl: $imageUrl, productUrl: $productUrl, price: $price, currency: $currency, wishlistId: $wishlistId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateWishRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.productUrl, productUrl) ||
                other.productUrl == productUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.wishlistId, wishlistId) ||
                other.wishlistId == wishlistId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, imageUrl,
      productUrl, price, currency, wishlistId);

  /// Create a copy of CreateWishRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateWishRequestImplCopyWith<_$CreateWishRequestImpl> get copyWith =>
      __$$CreateWishRequestImplCopyWithImpl<_$CreateWishRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateWishRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateWishRequest implements CreateWishRequest {
  const factory _CreateWishRequest(
          {required final String title,
          final String? description,
          @JsonKey(name: 'image_url') final String? imageUrl,
          @JsonKey(name: 'product_url') final String? productUrl,
          final double? price,
          final String? currency,
          @JsonKey(name: 'wishlist_id') required final int wishlistId}) =
      _$CreateWishRequestImpl;

  factory _CreateWishRequest.fromJson(Map<String, dynamic> json) =
      _$CreateWishRequestImpl.fromJson;

  @override
  String get title;
  @override
  String? get description;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'product_url')
  String? get productUrl;
  @override
  double? get price;
  @override
  String? get currency;
  @override
  @JsonKey(name: 'wishlist_id')
  int get wishlistId;

  /// Create a copy of CreateWishRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateWishRequestImplCopyWith<_$CreateWishRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
