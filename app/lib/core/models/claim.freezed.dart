// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'claim.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Claim _$ClaimFromJson(Map<String, dynamic> json) {
  return _Claim.fromJson(json);
}

/// @nodoc
mixin _$Claim {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'wish_id')
  int get wishId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'guest_id')
  String? get guestId => throw _privateConstructorUsedError;
  @JsonKey(name: 'claimed_at')
  DateTime get claimedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchased_at')
  DateTime? get purchasedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'contribution_amount')
  double? get contributionAmount => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError; // Relations
  Wish? get wish => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Claim to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Claim
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClaimCopyWith<Claim> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClaimCopyWith<$Res> {
  factory $ClaimCopyWith(Claim value, $Res Function(Claim) then) =
      _$ClaimCopyWithImpl<$Res, Claim>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'wish_id') int wishId,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'guest_id') String? guestId,
      @JsonKey(name: 'claimed_at') DateTime claimedAt,
      @JsonKey(name: 'purchased_at') DateTime? purchasedAt,
      @JsonKey(name: 'contribution_amount') double? contributionAmount,
      String? notes,
      Wish? wish,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  $WishCopyWith<$Res>? get wish;
}

/// @nodoc
class _$ClaimCopyWithImpl<$Res, $Val extends Claim>
    implements $ClaimCopyWith<$Res> {
  _$ClaimCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Claim
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? wishId = null,
    Object? userId = freezed,
    Object? guestId = freezed,
    Object? claimedAt = null,
    Object? purchasedAt = freezed,
    Object? contributionAmount = freezed,
    Object? notes = freezed,
    Object? wish = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      wishId: null == wishId
          ? _value.wishId
          : wishId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      guestId: freezed == guestId
          ? _value.guestId
          : guestId // ignore: cast_nullable_to_non_nullable
              as String?,
      claimedAt: null == claimedAt
          ? _value.claimedAt
          : claimedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      purchasedAt: freezed == purchasedAt
          ? _value.purchasedAt
          : purchasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      contributionAmount: freezed == contributionAmount
          ? _value.contributionAmount
          : contributionAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      wish: freezed == wish
          ? _value.wish
          : wish // ignore: cast_nullable_to_non_nullable
              as Wish?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of Claim
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WishCopyWith<$Res>? get wish {
    if (_value.wish == null) {
      return null;
    }

    return $WishCopyWith<$Res>(_value.wish!, (value) {
      return _then(_value.copyWith(wish: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClaimImplCopyWith<$Res> implements $ClaimCopyWith<$Res> {
  factory _$$ClaimImplCopyWith(
          _$ClaimImpl value, $Res Function(_$ClaimImpl) then) =
      __$$ClaimImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'wish_id') int wishId,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'guest_id') String? guestId,
      @JsonKey(name: 'claimed_at') DateTime claimedAt,
      @JsonKey(name: 'purchased_at') DateTime? purchasedAt,
      @JsonKey(name: 'contribution_amount') double? contributionAmount,
      String? notes,
      Wish? wish,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  @override
  $WishCopyWith<$Res>? get wish;
}

/// @nodoc
class __$$ClaimImplCopyWithImpl<$Res>
    extends _$ClaimCopyWithImpl<$Res, _$ClaimImpl>
    implements _$$ClaimImplCopyWith<$Res> {
  __$$ClaimImplCopyWithImpl(
      _$ClaimImpl _value, $Res Function(_$ClaimImpl) _then)
      : super(_value, _then);

  /// Create a copy of Claim
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? wishId = null,
    Object? userId = freezed,
    Object? guestId = freezed,
    Object? claimedAt = null,
    Object? purchasedAt = freezed,
    Object? contributionAmount = freezed,
    Object? notes = freezed,
    Object? wish = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ClaimImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      wishId: null == wishId
          ? _value.wishId
          : wishId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      guestId: freezed == guestId
          ? _value.guestId
          : guestId // ignore: cast_nullable_to_non_nullable
              as String?,
      claimedAt: null == claimedAt
          ? _value.claimedAt
          : claimedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      purchasedAt: freezed == purchasedAt
          ? _value.purchasedAt
          : purchasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      contributionAmount: freezed == contributionAmount
          ? _value.contributionAmount
          : contributionAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      wish: freezed == wish
          ? _value.wish
          : wish // ignore: cast_nullable_to_non_nullable
              as Wish?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClaimImpl implements _Claim {
  const _$ClaimImpl(
      {required this.id,
      @JsonKey(name: 'wish_id') required this.wishId,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'guest_id') this.guestId,
      @JsonKey(name: 'claimed_at') required this.claimedAt,
      @JsonKey(name: 'purchased_at') this.purchasedAt,
      @JsonKey(name: 'contribution_amount') this.contributionAmount,
      this.notes,
      this.wish,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$ClaimImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClaimImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'wish_id')
  final int wishId;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'guest_id')
  final String? guestId;
  @override
  @JsonKey(name: 'claimed_at')
  final DateTime claimedAt;
  @override
  @JsonKey(name: 'purchased_at')
  final DateTime? purchasedAt;
  @override
  @JsonKey(name: 'contribution_amount')
  final double? contributionAmount;
  @override
  final String? notes;
// Relations
  @override
  final Wish? wish;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Claim(id: $id, wishId: $wishId, userId: $userId, guestId: $guestId, claimedAt: $claimedAt, purchasedAt: $purchasedAt, contributionAmount: $contributionAmount, notes: $notes, wish: $wish, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClaimImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.wishId, wishId) || other.wishId == wishId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.guestId, guestId) || other.guestId == guestId) &&
            (identical(other.claimedAt, claimedAt) ||
                other.claimedAt == claimedAt) &&
            (identical(other.purchasedAt, purchasedAt) ||
                other.purchasedAt == purchasedAt) &&
            (identical(other.contributionAmount, contributionAmount) ||
                other.contributionAmount == contributionAmount) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.wish, wish) || other.wish == wish) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      wishId,
      userId,
      guestId,
      claimedAt,
      purchasedAt,
      contributionAmount,
      notes,
      wish,
      createdAt,
      updatedAt);

  /// Create a copy of Claim
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClaimImplCopyWith<_$ClaimImpl> get copyWith =>
      __$$ClaimImplCopyWithImpl<_$ClaimImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClaimImplToJson(
      this,
    );
  }
}

abstract class _Claim implements Claim {
  const factory _Claim(
      {required final int id,
      @JsonKey(name: 'wish_id') required final int wishId,
      @JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'guest_id') final String? guestId,
      @JsonKey(name: 'claimed_at') required final DateTime claimedAt,
      @JsonKey(name: 'purchased_at') final DateTime? purchasedAt,
      @JsonKey(name: 'contribution_amount') final double? contributionAmount,
      final String? notes,
      final Wish? wish,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$ClaimImpl;

  factory _Claim.fromJson(Map<String, dynamic> json) = _$ClaimImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'wish_id')
  int get wishId;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'guest_id')
  String? get guestId;
  @override
  @JsonKey(name: 'claimed_at')
  DateTime get claimedAt;
  @override
  @JsonKey(name: 'purchased_at')
  DateTime? get purchasedAt;
  @override
  @JsonKey(name: 'contribution_amount')
  double? get contributionAmount;
  @override
  String? get notes; // Relations
  @override
  Wish? get wish;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of Claim
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClaimImplCopyWith<_$ClaimImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClaimRequest _$ClaimRequestFromJson(Map<String, dynamic> json) {
  return _ClaimRequest.fromJson(json);
}

/// @nodoc
mixin _$ClaimRequest {
  @JsonKey(name: 'wish_id')
  int get wishId => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this ClaimRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClaimRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClaimRequestCopyWith<ClaimRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClaimRequestCopyWith<$Res> {
  factory $ClaimRequestCopyWith(
          ClaimRequest value, $Res Function(ClaimRequest) then) =
      _$ClaimRequestCopyWithImpl<$Res, ClaimRequest>;
  @useResult
  $Res call({@JsonKey(name: 'wish_id') int wishId, String? notes});
}

/// @nodoc
class _$ClaimRequestCopyWithImpl<$Res, $Val extends ClaimRequest>
    implements $ClaimRequestCopyWith<$Res> {
  _$ClaimRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClaimRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wishId = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      wishId: null == wishId
          ? _value.wishId
          : wishId // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClaimRequestImplCopyWith<$Res>
    implements $ClaimRequestCopyWith<$Res> {
  factory _$$ClaimRequestImplCopyWith(
          _$ClaimRequestImpl value, $Res Function(_$ClaimRequestImpl) then) =
      __$$ClaimRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'wish_id') int wishId, String? notes});
}

/// @nodoc
class __$$ClaimRequestImplCopyWithImpl<$Res>
    extends _$ClaimRequestCopyWithImpl<$Res, _$ClaimRequestImpl>
    implements _$$ClaimRequestImplCopyWith<$Res> {
  __$$ClaimRequestImplCopyWithImpl(
      _$ClaimRequestImpl _value, $Res Function(_$ClaimRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClaimRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wishId = null,
    Object? notes = freezed,
  }) {
    return _then(_$ClaimRequestImpl(
      wishId: null == wishId
          ? _value.wishId
          : wishId // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClaimRequestImpl implements _ClaimRequest {
  const _$ClaimRequestImpl(
      {@JsonKey(name: 'wish_id') required this.wishId, this.notes});

  factory _$ClaimRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClaimRequestImplFromJson(json);

  @override
  @JsonKey(name: 'wish_id')
  final int wishId;
  @override
  final String? notes;

  @override
  String toString() {
    return 'ClaimRequest(wishId: $wishId, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClaimRequestImpl &&
            (identical(other.wishId, wishId) || other.wishId == wishId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, wishId, notes);

  /// Create a copy of ClaimRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClaimRequestImplCopyWith<_$ClaimRequestImpl> get copyWith =>
      __$$ClaimRequestImplCopyWithImpl<_$ClaimRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClaimRequestImplToJson(
      this,
    );
  }
}

abstract class _ClaimRequest implements ClaimRequest {
  const factory _ClaimRequest(
      {@JsonKey(name: 'wish_id') required final int wishId,
      final String? notes}) = _$ClaimRequestImpl;

  factory _ClaimRequest.fromJson(Map<String, dynamic> json) =
      _$ClaimRequestImpl.fromJson;

  @override
  @JsonKey(name: 'wish_id')
  int get wishId;
  @override
  String? get notes;

  /// Create a copy of ClaimRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClaimRequestImplCopyWith<_$ClaimRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClaimResponse _$ClaimResponseFromJson(Map<String, dynamic> json) {
  return _ClaimResponse.fromJson(json);
}

/// @nodoc
mixin _$ClaimResponse {
  Claim get claim => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  /// Serializes this ClaimResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClaimResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClaimResponseCopyWith<ClaimResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClaimResponseCopyWith<$Res> {
  factory $ClaimResponseCopyWith(
          ClaimResponse value, $Res Function(ClaimResponse) then) =
      _$ClaimResponseCopyWithImpl<$Res, ClaimResponse>;
  @useResult
  $Res call({Claim claim, String message, bool success});

  $ClaimCopyWith<$Res> get claim;
}

/// @nodoc
class _$ClaimResponseCopyWithImpl<$Res, $Val extends ClaimResponse>
    implements $ClaimResponseCopyWith<$Res> {
  _$ClaimResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClaimResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? claim = null,
    Object? message = null,
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      claim: null == claim
          ? _value.claim
          : claim // ignore: cast_nullable_to_non_nullable
              as Claim,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ClaimResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClaimCopyWith<$Res> get claim {
    return $ClaimCopyWith<$Res>(_value.claim, (value) {
      return _then(_value.copyWith(claim: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClaimResponseImplCopyWith<$Res>
    implements $ClaimResponseCopyWith<$Res> {
  factory _$$ClaimResponseImplCopyWith(
          _$ClaimResponseImpl value, $Res Function(_$ClaimResponseImpl) then) =
      __$$ClaimResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Claim claim, String message, bool success});

  @override
  $ClaimCopyWith<$Res> get claim;
}

/// @nodoc
class __$$ClaimResponseImplCopyWithImpl<$Res>
    extends _$ClaimResponseCopyWithImpl<$Res, _$ClaimResponseImpl>
    implements _$$ClaimResponseImplCopyWith<$Res> {
  __$$ClaimResponseImplCopyWithImpl(
      _$ClaimResponseImpl _value, $Res Function(_$ClaimResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClaimResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? claim = null,
    Object? message = null,
    Object? success = null,
  }) {
    return _then(_$ClaimResponseImpl(
      claim: null == claim
          ? _value.claim
          : claim // ignore: cast_nullable_to_non_nullable
              as Claim,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClaimResponseImpl implements _ClaimResponse {
  const _$ClaimResponseImpl(
      {required this.claim, required this.message, this.success = true});

  factory _$ClaimResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClaimResponseImplFromJson(json);

  @override
  final Claim claim;
  @override
  final String message;
  @override
  @JsonKey()
  final bool success;

  @override
  String toString() {
    return 'ClaimResponse(claim: $claim, message: $message, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClaimResponseImpl &&
            (identical(other.claim, claim) || other.claim == claim) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, claim, message, success);

  /// Create a copy of ClaimResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClaimResponseImplCopyWith<_$ClaimResponseImpl> get copyWith =>
      __$$ClaimResponseImplCopyWithImpl<_$ClaimResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClaimResponseImplToJson(
      this,
    );
  }
}

abstract class _ClaimResponse implements ClaimResponse {
  const factory _ClaimResponse(
      {required final Claim claim,
      required final String message,
      final bool success}) = _$ClaimResponseImpl;

  factory _ClaimResponse.fromJson(Map<String, dynamic> json) =
      _$ClaimResponseImpl.fromJson;

  @override
  Claim get claim;
  @override
  String get message;
  @override
  bool get success;

  /// Create a copy of ClaimResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClaimResponseImplCopyWith<_$ClaimResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
