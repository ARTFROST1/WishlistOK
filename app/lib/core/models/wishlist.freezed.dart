// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Wishlist _$WishlistFromJson(Map<String, dynamic> json) {
  return _Wishlist.fromJson(json);
}

/// @nodoc
mixin _$Wishlist {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'event_date')
  DateTime? get eventDate => throw _privateConstructorUsedError;
  WishlistVisibility get visibility => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'share_token')
  String? get shareToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'wishes_count')
  int get wishesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_wishes_count')
  int get availableWishesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'claimed_wishes_count')
  int get claimedWishesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_value')
  double? get totalValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'claimed_value')
  double? get claimedValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'share_url')
  String? get shareUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'public_url')
  String? get publicUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt =>
      throw _privateConstructorUsedError; // Optional: include wishes when fetching details
  List<Wish>? get wishes => throw _privateConstructorUsedError;

  /// Serializes this Wishlist to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Wishlist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WishlistCopyWith<Wishlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishlistCopyWith<$Res> {
  factory $WishlistCopyWith(Wishlist value, $Res Function(Wishlist) then) =
      _$WishlistCopyWithImpl<$Res, Wishlist>;
  @useResult
  $Res call(
      {int id,
      String title,
      String? description,
      @JsonKey(name: 'event_date') DateTime? eventDate,
      WishlistVisibility visibility,
      String slug,
      @JsonKey(name: 'share_token') String? shareToken,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'wishes_count') int wishesCount,
      @JsonKey(name: 'available_wishes_count') int availableWishesCount,
      @JsonKey(name: 'claimed_wishes_count') int claimedWishesCount,
      @JsonKey(name: 'total_value') double? totalValue,
      @JsonKey(name: 'claimed_value') double? claimedValue,
      @JsonKey(name: 'share_url') String? shareUrl,
      @JsonKey(name: 'public_url') String? publicUrl,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      List<Wish>? wishes});
}

/// @nodoc
class _$WishlistCopyWithImpl<$Res, $Val extends Wishlist>
    implements $WishlistCopyWith<$Res> {
  _$WishlistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Wishlist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? eventDate = freezed,
    Object? visibility = null,
    Object? slug = null,
    Object? shareToken = freezed,
    Object? userId = null,
    Object? wishesCount = null,
    Object? availableWishesCount = null,
    Object? claimedWishesCount = null,
    Object? totalValue = freezed,
    Object? claimedValue = freezed,
    Object? shareUrl = freezed,
    Object? publicUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? wishes = freezed,
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
      eventDate: freezed == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as WishlistVisibility,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      shareToken: freezed == shareToken
          ? _value.shareToken
          : shareToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      wishesCount: null == wishesCount
          ? _value.wishesCount
          : wishesCount // ignore: cast_nullable_to_non_nullable
              as int,
      availableWishesCount: null == availableWishesCount
          ? _value.availableWishesCount
          : availableWishesCount // ignore: cast_nullable_to_non_nullable
              as int,
      claimedWishesCount: null == claimedWishesCount
          ? _value.claimedWishesCount
          : claimedWishesCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalValue: freezed == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double?,
      claimedValue: freezed == claimedValue
          ? _value.claimedValue
          : claimedValue // ignore: cast_nullable_to_non_nullable
              as double?,
      shareUrl: freezed == shareUrl
          ? _value.shareUrl
          : shareUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      publicUrl: freezed == publicUrl
          ? _value.publicUrl
          : publicUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      wishes: freezed == wishes
          ? _value.wishes
          : wishes // ignore: cast_nullable_to_non_nullable
              as List<Wish>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WishlistImplCopyWith<$Res>
    implements $WishlistCopyWith<$Res> {
  factory _$$WishlistImplCopyWith(
          _$WishlistImpl value, $Res Function(_$WishlistImpl) then) =
      __$$WishlistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String? description,
      @JsonKey(name: 'event_date') DateTime? eventDate,
      WishlistVisibility visibility,
      String slug,
      @JsonKey(name: 'share_token') String? shareToken,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'wishes_count') int wishesCount,
      @JsonKey(name: 'available_wishes_count') int availableWishesCount,
      @JsonKey(name: 'claimed_wishes_count') int claimedWishesCount,
      @JsonKey(name: 'total_value') double? totalValue,
      @JsonKey(name: 'claimed_value') double? claimedValue,
      @JsonKey(name: 'share_url') String? shareUrl,
      @JsonKey(name: 'public_url') String? publicUrl,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      List<Wish>? wishes});
}

/// @nodoc
class __$$WishlistImplCopyWithImpl<$Res>
    extends _$WishlistCopyWithImpl<$Res, _$WishlistImpl>
    implements _$$WishlistImplCopyWith<$Res> {
  __$$WishlistImplCopyWithImpl(
      _$WishlistImpl _value, $Res Function(_$WishlistImpl) _then)
      : super(_value, _then);

  /// Create a copy of Wishlist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? eventDate = freezed,
    Object? visibility = null,
    Object? slug = null,
    Object? shareToken = freezed,
    Object? userId = null,
    Object? wishesCount = null,
    Object? availableWishesCount = null,
    Object? claimedWishesCount = null,
    Object? totalValue = freezed,
    Object? claimedValue = freezed,
    Object? shareUrl = freezed,
    Object? publicUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? wishes = freezed,
  }) {
    return _then(_$WishlistImpl(
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
      eventDate: freezed == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as WishlistVisibility,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      shareToken: freezed == shareToken
          ? _value.shareToken
          : shareToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      wishesCount: null == wishesCount
          ? _value.wishesCount
          : wishesCount // ignore: cast_nullable_to_non_nullable
              as int,
      availableWishesCount: null == availableWishesCount
          ? _value.availableWishesCount
          : availableWishesCount // ignore: cast_nullable_to_non_nullable
              as int,
      claimedWishesCount: null == claimedWishesCount
          ? _value.claimedWishesCount
          : claimedWishesCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalValue: freezed == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double?,
      claimedValue: freezed == claimedValue
          ? _value.claimedValue
          : claimedValue // ignore: cast_nullable_to_non_nullable
              as double?,
      shareUrl: freezed == shareUrl
          ? _value.shareUrl
          : shareUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      publicUrl: freezed == publicUrl
          ? _value.publicUrl
          : publicUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      wishes: freezed == wishes
          ? _value._wishes
          : wishes // ignore: cast_nullable_to_non_nullable
              as List<Wish>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WishlistImpl implements _Wishlist {
  const _$WishlistImpl(
      {required this.id,
      required this.title,
      this.description,
      @JsonKey(name: 'event_date') this.eventDate,
      required this.visibility,
      required this.slug,
      @JsonKey(name: 'share_token') this.shareToken,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'wishes_count') this.wishesCount = 0,
      @JsonKey(name: 'available_wishes_count') this.availableWishesCount = 0,
      @JsonKey(name: 'claimed_wishes_count') this.claimedWishesCount = 0,
      @JsonKey(name: 'total_value') this.totalValue,
      @JsonKey(name: 'claimed_value') this.claimedValue,
      @JsonKey(name: 'share_url') this.shareUrl,
      @JsonKey(name: 'public_url') this.publicUrl,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      final List<Wish>? wishes})
      : _wishes = wishes;

  factory _$WishlistImpl.fromJson(Map<String, dynamic> json) =>
      _$$WishlistImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String? description;
  @override
  @JsonKey(name: 'event_date')
  final DateTime? eventDate;
  @override
  final WishlistVisibility visibility;
  @override
  final String slug;
  @override
  @JsonKey(name: 'share_token')
  final String? shareToken;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'wishes_count')
  final int wishesCount;
  @override
  @JsonKey(name: 'available_wishes_count')
  final int availableWishesCount;
  @override
  @JsonKey(name: 'claimed_wishes_count')
  final int claimedWishesCount;
  @override
  @JsonKey(name: 'total_value')
  final double? totalValue;
  @override
  @JsonKey(name: 'claimed_value')
  final double? claimedValue;
  @override
  @JsonKey(name: 'share_url')
  final String? shareUrl;
  @override
  @JsonKey(name: 'public_url')
  final String? publicUrl;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
// Optional: include wishes when fetching details
  final List<Wish>? _wishes;
// Optional: include wishes when fetching details
  @override
  List<Wish>? get wishes {
    final value = _wishes;
    if (value == null) return null;
    if (_wishes is EqualUnmodifiableListView) return _wishes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Wishlist(id: $id, title: $title, description: $description, eventDate: $eventDate, visibility: $visibility, slug: $slug, shareToken: $shareToken, userId: $userId, wishesCount: $wishesCount, availableWishesCount: $availableWishesCount, claimedWishesCount: $claimedWishesCount, totalValue: $totalValue, claimedValue: $claimedValue, shareUrl: $shareUrl, publicUrl: $publicUrl, createdAt: $createdAt, updatedAt: $updatedAt, wishes: $wishes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WishlistImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.eventDate, eventDate) ||
                other.eventDate == eventDate) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.shareToken, shareToken) ||
                other.shareToken == shareToken) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.wishesCount, wishesCount) ||
                other.wishesCount == wishesCount) &&
            (identical(other.availableWishesCount, availableWishesCount) ||
                other.availableWishesCount == availableWishesCount) &&
            (identical(other.claimedWishesCount, claimedWishesCount) ||
                other.claimedWishesCount == claimedWishesCount) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.claimedValue, claimedValue) ||
                other.claimedValue == claimedValue) &&
            (identical(other.shareUrl, shareUrl) ||
                other.shareUrl == shareUrl) &&
            (identical(other.publicUrl, publicUrl) ||
                other.publicUrl == publicUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._wishes, _wishes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      eventDate,
      visibility,
      slug,
      shareToken,
      userId,
      wishesCount,
      availableWishesCount,
      claimedWishesCount,
      totalValue,
      claimedValue,
      shareUrl,
      publicUrl,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_wishes));

  /// Create a copy of Wishlist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WishlistImplCopyWith<_$WishlistImpl> get copyWith =>
      __$$WishlistImplCopyWithImpl<_$WishlistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WishlistImplToJson(
      this,
    );
  }
}

abstract class _Wishlist implements Wishlist {
  const factory _Wishlist(
      {required final int id,
      required final String title,
      final String? description,
      @JsonKey(name: 'event_date') final DateTime? eventDate,
      required final WishlistVisibility visibility,
      required final String slug,
      @JsonKey(name: 'share_token') final String? shareToken,
      @JsonKey(name: 'user_id') required final int userId,
      @JsonKey(name: 'wishes_count') final int wishesCount,
      @JsonKey(name: 'available_wishes_count') final int availableWishesCount,
      @JsonKey(name: 'claimed_wishes_count') final int claimedWishesCount,
      @JsonKey(name: 'total_value') final double? totalValue,
      @JsonKey(name: 'claimed_value') final double? claimedValue,
      @JsonKey(name: 'share_url') final String? shareUrl,
      @JsonKey(name: 'public_url') final String? publicUrl,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      final List<Wish>? wishes}) = _$WishlistImpl;

  factory _Wishlist.fromJson(Map<String, dynamic> json) =
      _$WishlistImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  @JsonKey(name: 'event_date')
  DateTime? get eventDate;
  @override
  WishlistVisibility get visibility;
  @override
  String get slug;
  @override
  @JsonKey(name: 'share_token')
  String? get shareToken;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'wishes_count')
  int get wishesCount;
  @override
  @JsonKey(name: 'available_wishes_count')
  int get availableWishesCount;
  @override
  @JsonKey(name: 'claimed_wishes_count')
  int get claimedWishesCount;
  @override
  @JsonKey(name: 'total_value')
  double? get totalValue;
  @override
  @JsonKey(name: 'claimed_value')
  double? get claimedValue;
  @override
  @JsonKey(name: 'share_url')
  String? get shareUrl;
  @override
  @JsonKey(name: 'public_url')
  String? get publicUrl;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt; // Optional: include wishes when fetching details
  @override
  List<Wish>? get wishes;

  /// Create a copy of Wishlist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WishlistImplCopyWith<_$WishlistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WishlistsResponse _$WishlistsResponseFromJson(Map<String, dynamic> json) {
  return _WishlistsResponse.fromJson(json);
}

/// @nodoc
mixin _$WishlistsResponse {
  List<Wishlist> get wishlists => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int get totalPages => throw _privateConstructorUsedError;

  /// Serializes this WishlistsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WishlistsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WishlistsResponseCopyWith<WishlistsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishlistsResponseCopyWith<$Res> {
  factory $WishlistsResponseCopyWith(
          WishlistsResponse value, $Res Function(WishlistsResponse) then) =
      _$WishlistsResponseCopyWithImpl<$Res, WishlistsResponse>;
  @useResult
  $Res call(
      {List<Wishlist> wishlists,
      int total,
      @JsonKey(name: 'per_page') int perPage,
      @JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'total_pages') int totalPages});
}

/// @nodoc
class _$WishlistsResponseCopyWithImpl<$Res, $Val extends WishlistsResponse>
    implements $WishlistsResponseCopyWith<$Res> {
  _$WishlistsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WishlistsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wishlists = null,
    Object? total = null,
    Object? perPage = null,
    Object? currentPage = null,
    Object? totalPages = null,
  }) {
    return _then(_value.copyWith(
      wishlists: null == wishlists
          ? _value.wishlists
          : wishlists // ignore: cast_nullable_to_non_nullable
              as List<Wishlist>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WishlistsResponseImplCopyWith<$Res>
    implements $WishlistsResponseCopyWith<$Res> {
  factory _$$WishlistsResponseImplCopyWith(_$WishlistsResponseImpl value,
          $Res Function(_$WishlistsResponseImpl) then) =
      __$$WishlistsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Wishlist> wishlists,
      int total,
      @JsonKey(name: 'per_page') int perPage,
      @JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'total_pages') int totalPages});
}

/// @nodoc
class __$$WishlistsResponseImplCopyWithImpl<$Res>
    extends _$WishlistsResponseCopyWithImpl<$Res, _$WishlistsResponseImpl>
    implements _$$WishlistsResponseImplCopyWith<$Res> {
  __$$WishlistsResponseImplCopyWithImpl(_$WishlistsResponseImpl _value,
      $Res Function(_$WishlistsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WishlistsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wishlists = null,
    Object? total = null,
    Object? perPage = null,
    Object? currentPage = null,
    Object? totalPages = null,
  }) {
    return _then(_$WishlistsResponseImpl(
      wishlists: null == wishlists
          ? _value._wishlists
          : wishlists // ignore: cast_nullable_to_non_nullable
              as List<Wishlist>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WishlistsResponseImpl implements _WishlistsResponse {
  const _$WishlistsResponseImpl(
      {required final List<Wishlist> wishlists,
      required this.total,
      @JsonKey(name: 'per_page') required this.perPage,
      @JsonKey(name: 'current_page') required this.currentPage,
      @JsonKey(name: 'total_pages') required this.totalPages})
      : _wishlists = wishlists;

  factory _$WishlistsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WishlistsResponseImplFromJson(json);

  final List<Wishlist> _wishlists;
  @override
  List<Wishlist> get wishlists {
    if (_wishlists is EqualUnmodifiableListView) return _wishlists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wishlists);
  }

  @override
  final int total;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;

  @override
  String toString() {
    return 'WishlistsResponse(wishlists: $wishlists, total: $total, perPage: $perPage, currentPage: $currentPage, totalPages: $totalPages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WishlistsResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._wishlists, _wishlists) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_wishlists),
      total,
      perPage,
      currentPage,
      totalPages);

  /// Create a copy of WishlistsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WishlistsResponseImplCopyWith<_$WishlistsResponseImpl> get copyWith =>
      __$$WishlistsResponseImplCopyWithImpl<_$WishlistsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WishlistsResponseImplToJson(
      this,
    );
  }
}

abstract class _WishlistsResponse implements WishlistsResponse {
  const factory _WishlistsResponse(
          {required final List<Wishlist> wishlists,
          required final int total,
          @JsonKey(name: 'per_page') required final int perPage,
          @JsonKey(name: 'current_page') required final int currentPage,
          @JsonKey(name: 'total_pages') required final int totalPages}) =
      _$WishlistsResponseImpl;

  factory _WishlistsResponse.fromJson(Map<String, dynamic> json) =
      _$WishlistsResponseImpl.fromJson;

  @override
  List<Wishlist> get wishlists;
  @override
  int get total;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;
  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(name: 'total_pages')
  int get totalPages;

  /// Create a copy of WishlistsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WishlistsResponseImplCopyWith<_$WishlistsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateWishlistRequest _$CreateWishlistRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateWishlistRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateWishlistRequest {
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'event_date')
  DateTime? get eventDate => throw _privateConstructorUsedError;
  WishlistVisibility get visibility => throw _privateConstructorUsedError;

  /// Serializes this CreateWishlistRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateWishlistRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateWishlistRequestCopyWith<CreateWishlistRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateWishlistRequestCopyWith<$Res> {
  factory $CreateWishlistRequestCopyWith(CreateWishlistRequest value,
          $Res Function(CreateWishlistRequest) then) =
      _$CreateWishlistRequestCopyWithImpl<$Res, CreateWishlistRequest>;
  @useResult
  $Res call(
      {String title,
      String? description,
      @JsonKey(name: 'event_date') DateTime? eventDate,
      WishlistVisibility visibility});
}

/// @nodoc
class _$CreateWishlistRequestCopyWithImpl<$Res,
        $Val extends CreateWishlistRequest>
    implements $CreateWishlistRequestCopyWith<$Res> {
  _$CreateWishlistRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateWishlistRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? eventDate = freezed,
    Object? visibility = null,
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
      eventDate: freezed == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as WishlistVisibility,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateWishlistRequestImplCopyWith<$Res>
    implements $CreateWishlistRequestCopyWith<$Res> {
  factory _$$CreateWishlistRequestImplCopyWith(
          _$CreateWishlistRequestImpl value,
          $Res Function(_$CreateWishlistRequestImpl) then) =
      __$$CreateWishlistRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String? description,
      @JsonKey(name: 'event_date') DateTime? eventDate,
      WishlistVisibility visibility});
}

/// @nodoc
class __$$CreateWishlistRequestImplCopyWithImpl<$Res>
    extends _$CreateWishlistRequestCopyWithImpl<$Res,
        _$CreateWishlistRequestImpl>
    implements _$$CreateWishlistRequestImplCopyWith<$Res> {
  __$$CreateWishlistRequestImplCopyWithImpl(_$CreateWishlistRequestImpl _value,
      $Res Function(_$CreateWishlistRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateWishlistRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? eventDate = freezed,
    Object? visibility = null,
  }) {
    return _then(_$CreateWishlistRequestImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDate: freezed == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as WishlistVisibility,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateWishlistRequestImpl implements _CreateWishlistRequest {
  const _$CreateWishlistRequestImpl(
      {required this.title,
      this.description,
      @JsonKey(name: 'event_date') this.eventDate,
      this.visibility = WishlistVisibility.linkOnly});

  factory _$CreateWishlistRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateWishlistRequestImplFromJson(json);

  @override
  final String title;
  @override
  final String? description;
  @override
  @JsonKey(name: 'event_date')
  final DateTime? eventDate;
  @override
  @JsonKey()
  final WishlistVisibility visibility;

  @override
  String toString() {
    return 'CreateWishlistRequest(title: $title, description: $description, eventDate: $eventDate, visibility: $visibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateWishlistRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.eventDate, eventDate) ||
                other.eventDate == eventDate) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, eventDate, visibility);

  /// Create a copy of CreateWishlistRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateWishlistRequestImplCopyWith<_$CreateWishlistRequestImpl>
      get copyWith => __$$CreateWishlistRequestImplCopyWithImpl<
          _$CreateWishlistRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateWishlistRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateWishlistRequest implements CreateWishlistRequest {
  const factory _CreateWishlistRequest(
      {required final String title,
      final String? description,
      @JsonKey(name: 'event_date') final DateTime? eventDate,
      final WishlistVisibility visibility}) = _$CreateWishlistRequestImpl;

  factory _CreateWishlistRequest.fromJson(Map<String, dynamic> json) =
      _$CreateWishlistRequestImpl.fromJson;

  @override
  String get title;
  @override
  String? get description;
  @override
  @JsonKey(name: 'event_date')
  DateTime? get eventDate;
  @override
  WishlistVisibility get visibility;

  /// Create a copy of CreateWishlistRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateWishlistRequestImplCopyWith<_$CreateWishlistRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
