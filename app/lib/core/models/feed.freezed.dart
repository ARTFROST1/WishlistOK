// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeedCategory _$FeedCategoryFromJson(Map<String, dynamic> json) {
  return _FeedCategory.fromJson(json);
}

/// @nodoc
mixin _$FeedCategory {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon_url')
  String? get iconUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'items_count')
  int get itemsCount => throw _privateConstructorUsedError;

  /// Serializes this FeedCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedCategoryCopyWith<FeedCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedCategoryCopyWith<$Res> {
  factory $FeedCategoryCopyWith(
          FeedCategory value, $Res Function(FeedCategory) then) =
      _$FeedCategoryCopyWithImpl<$Res, FeedCategory>;
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      @JsonKey(name: 'icon_url') String? iconUrl,
      String? description,
      @JsonKey(name: 'items_count') int itemsCount});
}

/// @nodoc
class _$FeedCategoryCopyWithImpl<$Res, $Val extends FeedCategory>
    implements $FeedCategoryCopyWith<$Res> {
  _$FeedCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? iconUrl = freezed,
    Object? description = freezed,
    Object? itemsCount = null,
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
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedCategoryImplCopyWith<$Res>
    implements $FeedCategoryCopyWith<$Res> {
  factory _$$FeedCategoryImplCopyWith(
          _$FeedCategoryImpl value, $Res Function(_$FeedCategoryImpl) then) =
      __$$FeedCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      @JsonKey(name: 'icon_url') String? iconUrl,
      String? description,
      @JsonKey(name: 'items_count') int itemsCount});
}

/// @nodoc
class __$$FeedCategoryImplCopyWithImpl<$Res>
    extends _$FeedCategoryCopyWithImpl<$Res, _$FeedCategoryImpl>
    implements _$$FeedCategoryImplCopyWith<$Res> {
  __$$FeedCategoryImplCopyWithImpl(
      _$FeedCategoryImpl _value, $Res Function(_$FeedCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? iconUrl = freezed,
    Object? description = freezed,
    Object? itemsCount = null,
  }) {
    return _then(_$FeedCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedCategoryImpl implements _FeedCategory {
  const _$FeedCategoryImpl(
      {required this.id,
      required this.name,
      required this.slug,
      @JsonKey(name: 'icon_url') this.iconUrl,
      this.description,
      @JsonKey(name: 'items_count') this.itemsCount = 0});

  factory _$FeedCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedCategoryImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String slug;
  @override
  @JsonKey(name: 'icon_url')
  final String? iconUrl;
  @override
  final String? description;
  @override
  @JsonKey(name: 'items_count')
  final int itemsCount;

  @override
  String toString() {
    return 'FeedCategory(id: $id, name: $name, slug: $slug, iconUrl: $iconUrl, description: $description, itemsCount: $itemsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.itemsCount, itemsCount) ||
                other.itemsCount == itemsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, slug, iconUrl, description, itemsCount);

  /// Create a copy of FeedCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedCategoryImplCopyWith<_$FeedCategoryImpl> get copyWith =>
      __$$FeedCategoryImplCopyWithImpl<_$FeedCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedCategoryImplToJson(
      this,
    );
  }
}

abstract class _FeedCategory implements FeedCategory {
  const factory _FeedCategory(
      {required final int id,
      required final String name,
      required final String slug,
      @JsonKey(name: 'icon_url') final String? iconUrl,
      final String? description,
      @JsonKey(name: 'items_count') final int itemsCount}) = _$FeedCategoryImpl;

  factory _FeedCategory.fromJson(Map<String, dynamic> json) =
      _$FeedCategoryImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get slug;
  @override
  @JsonKey(name: 'icon_url')
  String? get iconUrl;
  @override
  String? get description;
  @override
  @JsonKey(name: 'items_count')
  int get itemsCount;

  /// Create a copy of FeedCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedCategoryImplCopyWith<_$FeedCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedCollection _$FeedCollectionFromJson(Map<String, dynamic> json) {
  return _FeedCollection.fromJson(json);
}

/// @nodoc
mixin _$FeedCollection {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_image_url')
  String? get coverImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_featured')
  bool get isFeatured => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_sponsored')
  bool get isSponsored => throw _privateConstructorUsedError;
  @JsonKey(name: 'items_count')
  int get itemsCount => throw _privateConstructorUsedError;
  List<FeedItem>? get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this FeedCollection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedCollectionCopyWith<FeedCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedCollectionCopyWith<$Res> {
  factory $FeedCollectionCopyWith(
          FeedCollection value, $Res Function(FeedCollection) then) =
      _$FeedCollectionCopyWithImpl<$Res, FeedCollection>;
  @useResult
  $Res call(
      {int id,
      String title,
      String slug,
      String? description,
      @JsonKey(name: 'cover_image_url') String? coverImageUrl,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'is_featured') bool isFeatured,
      @JsonKey(name: 'is_sponsored') bool isSponsored,
      @JsonKey(name: 'items_count') int itemsCount,
      List<FeedItem>? items,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$FeedCollectionCopyWithImpl<$Res, $Val extends FeedCollection>
    implements $FeedCollectionCopyWith<$Res> {
  _$FeedCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? slug = null,
    Object? description = freezed,
    Object? coverImageUrl = freezed,
    Object? categoryId = freezed,
    Object? isFeatured = null,
    Object? isSponsored = null,
    Object? itemsCount = null,
    Object? items = freezed,
    Object? createdAt = freezed,
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
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      isSponsored: null == isSponsored
          ? _value.isSponsored
          : isSponsored // ignore: cast_nullable_to_non_nullable
              as bool,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FeedItem>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedCollectionImplCopyWith<$Res>
    implements $FeedCollectionCopyWith<$Res> {
  factory _$$FeedCollectionImplCopyWith(_$FeedCollectionImpl value,
          $Res Function(_$FeedCollectionImpl) then) =
      __$$FeedCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String slug,
      String? description,
      @JsonKey(name: 'cover_image_url') String? coverImageUrl,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'is_featured') bool isFeatured,
      @JsonKey(name: 'is_sponsored') bool isSponsored,
      @JsonKey(name: 'items_count') int itemsCount,
      List<FeedItem>? items,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$FeedCollectionImplCopyWithImpl<$Res>
    extends _$FeedCollectionCopyWithImpl<$Res, _$FeedCollectionImpl>
    implements _$$FeedCollectionImplCopyWith<$Res> {
  __$$FeedCollectionImplCopyWithImpl(
      _$FeedCollectionImpl _value, $Res Function(_$FeedCollectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? slug = null,
    Object? description = freezed,
    Object? coverImageUrl = freezed,
    Object? categoryId = freezed,
    Object? isFeatured = null,
    Object? isSponsored = null,
    Object? itemsCount = null,
    Object? items = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$FeedCollectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      isSponsored: null == isSponsored
          ? _value.isSponsored
          : isSponsored // ignore: cast_nullable_to_non_nullable
              as bool,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FeedItem>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedCollectionImpl implements _FeedCollection {
  const _$FeedCollectionImpl(
      {required this.id,
      required this.title,
      required this.slug,
      this.description,
      @JsonKey(name: 'cover_image_url') this.coverImageUrl,
      @JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'is_featured') this.isFeatured = false,
      @JsonKey(name: 'is_sponsored') this.isSponsored = false,
      @JsonKey(name: 'items_count') this.itemsCount = 0,
      final List<FeedItem>? items,
      @JsonKey(name: 'created_at') this.createdAt})
      : _items = items;

  factory _$FeedCollectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedCollectionImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String slug;
  @override
  final String? description;
  @override
  @JsonKey(name: 'cover_image_url')
  final String? coverImageUrl;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @JsonKey(name: 'is_featured')
  final bool isFeatured;
  @override
  @JsonKey(name: 'is_sponsored')
  final bool isSponsored;
  @override
  @JsonKey(name: 'items_count')
  final int itemsCount;
  final List<FeedItem>? _items;
  @override
  List<FeedItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'FeedCollection(id: $id, title: $title, slug: $slug, description: $description, coverImageUrl: $coverImageUrl, categoryId: $categoryId, isFeatured: $isFeatured, isSponsored: $isSponsored, itemsCount: $itemsCount, items: $items, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedCollectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.isSponsored, isSponsored) ||
                other.isSponsored == isSponsored) &&
            (identical(other.itemsCount, itemsCount) ||
                other.itemsCount == itemsCount) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      slug,
      description,
      coverImageUrl,
      categoryId,
      isFeatured,
      isSponsored,
      itemsCount,
      const DeepCollectionEquality().hash(_items),
      createdAt);

  /// Create a copy of FeedCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedCollectionImplCopyWith<_$FeedCollectionImpl> get copyWith =>
      __$$FeedCollectionImplCopyWithImpl<_$FeedCollectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedCollectionImplToJson(
      this,
    );
  }
}

abstract class _FeedCollection implements FeedCollection {
  const factory _FeedCollection(
          {required final int id,
          required final String title,
          required final String slug,
          final String? description,
          @JsonKey(name: 'cover_image_url') final String? coverImageUrl,
          @JsonKey(name: 'category_id') final int? categoryId,
          @JsonKey(name: 'is_featured') final bool isFeatured,
          @JsonKey(name: 'is_sponsored') final bool isSponsored,
          @JsonKey(name: 'items_count') final int itemsCount,
          final List<FeedItem>? items,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$FeedCollectionImpl;

  factory _FeedCollection.fromJson(Map<String, dynamic> json) =
      _$FeedCollectionImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get slug;
  @override
  String? get description;
  @override
  @JsonKey(name: 'cover_image_url')
  String? get coverImageUrl;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  @JsonKey(name: 'is_featured')
  bool get isFeatured;
  @override
  @JsonKey(name: 'is_sponsored')
  bool get isSponsored;
  @override
  @JsonKey(name: 'items_count')
  int get itemsCount;
  @override
  List<FeedItem>? get items;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of FeedCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedCollectionImplCopyWith<_$FeedCollectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedItem _$FeedItemFromJson(Map<String, dynamic> json) {
  return _FeedItem.fromJson(json);
}

/// @nodoc
mixin _$FeedItem {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_url')
  String? get productUrl => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'collection_id')
  int get collectionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_name')
  String? get brandName => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_sponsored')
  bool get isSponsored => throw _privateConstructorUsedError;
  @JsonKey(name: 'click_count')
  int get clickCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'add_count')
  int get addCount => throw _privateConstructorUsedError;

  /// Serializes this FeedItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedItemCopyWith<FeedItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedItemCopyWith<$Res> {
  factory $FeedItemCopyWith(FeedItem value, $Res Function(FeedItem) then) =
      _$FeedItemCopyWithImpl<$Res, FeedItem>;
  @useResult
  $Res call(
      {int id,
      String title,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'product_url') String? productUrl,
      double? price,
      String? currency,
      @JsonKey(name: 'collection_id') int collectionId,
      @JsonKey(name: 'brand_name') String? brandName,
      @JsonKey(name: 'is_sponsored') bool isSponsored,
      @JsonKey(name: 'click_count') int clickCount,
      @JsonKey(name: 'add_count') int addCount});
}

/// @nodoc
class _$FeedItemCopyWithImpl<$Res, $Val extends FeedItem>
    implements $FeedItemCopyWith<$Res> {
  _$FeedItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedItem
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
    Object? collectionId = null,
    Object? brandName = freezed,
    Object? isSponsored = null,
    Object? clickCount = null,
    Object? addCount = null,
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
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
      isSponsored: null == isSponsored
          ? _value.isSponsored
          : isSponsored // ignore: cast_nullable_to_non_nullable
              as bool,
      clickCount: null == clickCount
          ? _value.clickCount
          : clickCount // ignore: cast_nullable_to_non_nullable
              as int,
      addCount: null == addCount
          ? _value.addCount
          : addCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedItemImplCopyWith<$Res>
    implements $FeedItemCopyWith<$Res> {
  factory _$$FeedItemImplCopyWith(
          _$FeedItemImpl value, $Res Function(_$FeedItemImpl) then) =
      __$$FeedItemImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'collection_id') int collectionId,
      @JsonKey(name: 'brand_name') String? brandName,
      @JsonKey(name: 'is_sponsored') bool isSponsored,
      @JsonKey(name: 'click_count') int clickCount,
      @JsonKey(name: 'add_count') int addCount});
}

/// @nodoc
class __$$FeedItemImplCopyWithImpl<$Res>
    extends _$FeedItemCopyWithImpl<$Res, _$FeedItemImpl>
    implements _$$FeedItemImplCopyWith<$Res> {
  __$$FeedItemImplCopyWithImpl(
      _$FeedItemImpl _value, $Res Function(_$FeedItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedItem
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
    Object? collectionId = null,
    Object? brandName = freezed,
    Object? isSponsored = null,
    Object? clickCount = null,
    Object? addCount = null,
  }) {
    return _then(_$FeedItemImpl(
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
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
      isSponsored: null == isSponsored
          ? _value.isSponsored
          : isSponsored // ignore: cast_nullable_to_non_nullable
              as bool,
      clickCount: null == clickCount
          ? _value.clickCount
          : clickCount // ignore: cast_nullable_to_non_nullable
              as int,
      addCount: null == addCount
          ? _value.addCount
          : addCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedItemImpl implements _FeedItem {
  const _$FeedItemImpl(
      {required this.id,
      required this.title,
      this.description,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'product_url') this.productUrl,
      this.price,
      this.currency,
      @JsonKey(name: 'collection_id') required this.collectionId,
      @JsonKey(name: 'brand_name') this.brandName,
      @JsonKey(name: 'is_sponsored') this.isSponsored = false,
      @JsonKey(name: 'click_count') this.clickCount = 0,
      @JsonKey(name: 'add_count') this.addCount = 0});

  factory _$FeedItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedItemImplFromJson(json);

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
  @JsonKey(name: 'collection_id')
  final int collectionId;
  @override
  @JsonKey(name: 'brand_name')
  final String? brandName;
  @override
  @JsonKey(name: 'is_sponsored')
  final bool isSponsored;
  @override
  @JsonKey(name: 'click_count')
  final int clickCount;
  @override
  @JsonKey(name: 'add_count')
  final int addCount;

  @override
  String toString() {
    return 'FeedItem(id: $id, title: $title, description: $description, imageUrl: $imageUrl, productUrl: $productUrl, price: $price, currency: $currency, collectionId: $collectionId, brandName: $brandName, isSponsored: $isSponsored, clickCount: $clickCount, addCount: $addCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedItemImpl &&
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
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.isSponsored, isSponsored) ||
                other.isSponsored == isSponsored) &&
            (identical(other.clickCount, clickCount) ||
                other.clickCount == clickCount) &&
            (identical(other.addCount, addCount) ||
                other.addCount == addCount));
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
      collectionId,
      brandName,
      isSponsored,
      clickCount,
      addCount);

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedItemImplCopyWith<_$FeedItemImpl> get copyWith =>
      __$$FeedItemImplCopyWithImpl<_$FeedItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedItemImplToJson(
      this,
    );
  }
}

abstract class _FeedItem implements FeedItem {
  const factory _FeedItem(
      {required final int id,
      required final String title,
      final String? description,
      @JsonKey(name: 'image_url') final String? imageUrl,
      @JsonKey(name: 'product_url') final String? productUrl,
      final double? price,
      final String? currency,
      @JsonKey(name: 'collection_id') required final int collectionId,
      @JsonKey(name: 'brand_name') final String? brandName,
      @JsonKey(name: 'is_sponsored') final bool isSponsored,
      @JsonKey(name: 'click_count') final int clickCount,
      @JsonKey(name: 'add_count') final int addCount}) = _$FeedItemImpl;

  factory _FeedItem.fromJson(Map<String, dynamic> json) =
      _$FeedItemImpl.fromJson;

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
  @JsonKey(name: 'collection_id')
  int get collectionId;
  @override
  @JsonKey(name: 'brand_name')
  String? get brandName;
  @override
  @JsonKey(name: 'is_sponsored')
  bool get isSponsored;
  @override
  @JsonKey(name: 'click_count')
  int get clickCount;
  @override
  @JsonKey(name: 'add_count')
  int get addCount;

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedItemImplCopyWith<_$FeedItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedResponse _$FeedResponseFromJson(Map<String, dynamic> json) {
  return _FeedResponse.fromJson(json);
}

/// @nodoc
mixin _$FeedResponse {
  List<FeedCategory> get categories => throw _privateConstructorUsedError;
  @JsonKey(name: 'featured_collections')
  List<FeedCollection> get featuredCollections =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'trending_items')
  List<FeedItem> get trendingItems => throw _privateConstructorUsedError;

  /// Serializes this FeedResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedResponseCopyWith<FeedResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedResponseCopyWith<$Res> {
  factory $FeedResponseCopyWith(
          FeedResponse value, $Res Function(FeedResponse) then) =
      _$FeedResponseCopyWithImpl<$Res, FeedResponse>;
  @useResult
  $Res call(
      {List<FeedCategory> categories,
      @JsonKey(name: 'featured_collections')
      List<FeedCollection> featuredCollections,
      @JsonKey(name: 'trending_items') List<FeedItem> trendingItems});
}

/// @nodoc
class _$FeedResponseCopyWithImpl<$Res, $Val extends FeedResponse>
    implements $FeedResponseCopyWith<$Res> {
  _$FeedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? featuredCollections = null,
    Object? trendingItems = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<FeedCategory>,
      featuredCollections: null == featuredCollections
          ? _value.featuredCollections
          : featuredCollections // ignore: cast_nullable_to_non_nullable
              as List<FeedCollection>,
      trendingItems: null == trendingItems
          ? _value.trendingItems
          : trendingItems // ignore: cast_nullable_to_non_nullable
              as List<FeedItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedResponseImplCopyWith<$Res>
    implements $FeedResponseCopyWith<$Res> {
  factory _$$FeedResponseImplCopyWith(
          _$FeedResponseImpl value, $Res Function(_$FeedResponseImpl) then) =
      __$$FeedResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<FeedCategory> categories,
      @JsonKey(name: 'featured_collections')
      List<FeedCollection> featuredCollections,
      @JsonKey(name: 'trending_items') List<FeedItem> trendingItems});
}

/// @nodoc
class __$$FeedResponseImplCopyWithImpl<$Res>
    extends _$FeedResponseCopyWithImpl<$Res, _$FeedResponseImpl>
    implements _$$FeedResponseImplCopyWith<$Res> {
  __$$FeedResponseImplCopyWithImpl(
      _$FeedResponseImpl _value, $Res Function(_$FeedResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? featuredCollections = null,
    Object? trendingItems = null,
  }) {
    return _then(_$FeedResponseImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<FeedCategory>,
      featuredCollections: null == featuredCollections
          ? _value._featuredCollections
          : featuredCollections // ignore: cast_nullable_to_non_nullable
              as List<FeedCollection>,
      trendingItems: null == trendingItems
          ? _value._trendingItems
          : trendingItems // ignore: cast_nullable_to_non_nullable
              as List<FeedItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedResponseImpl implements _FeedResponse {
  const _$FeedResponseImpl(
      {required final List<FeedCategory> categories,
      @JsonKey(name: 'featured_collections')
      required final List<FeedCollection> featuredCollections,
      @JsonKey(name: 'trending_items')
      required final List<FeedItem> trendingItems})
      : _categories = categories,
        _featuredCollections = featuredCollections,
        _trendingItems = trendingItems;

  factory _$FeedResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedResponseImplFromJson(json);

  final List<FeedCategory> _categories;
  @override
  List<FeedCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<FeedCollection> _featuredCollections;
  @override
  @JsonKey(name: 'featured_collections')
  List<FeedCollection> get featuredCollections {
    if (_featuredCollections is EqualUnmodifiableListView)
      return _featuredCollections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_featuredCollections);
  }

  final List<FeedItem> _trendingItems;
  @override
  @JsonKey(name: 'trending_items')
  List<FeedItem> get trendingItems {
    if (_trendingItems is EqualUnmodifiableListView) return _trendingItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingItems);
  }

  @override
  String toString() {
    return 'FeedResponse(categories: $categories, featuredCollections: $featuredCollections, trendingItems: $trendingItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._featuredCollections, _featuredCollections) &&
            const DeepCollectionEquality()
                .equals(other._trendingItems, _trendingItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_featuredCollections),
      const DeepCollectionEquality().hash(_trendingItems));

  /// Create a copy of FeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedResponseImplCopyWith<_$FeedResponseImpl> get copyWith =>
      __$$FeedResponseImplCopyWithImpl<_$FeedResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedResponseImplToJson(
      this,
    );
  }
}

abstract class _FeedResponse implements FeedResponse {
  const factory _FeedResponse(
      {required final List<FeedCategory> categories,
      @JsonKey(name: 'featured_collections')
      required final List<FeedCollection> featuredCollections,
      @JsonKey(name: 'trending_items')
      required final List<FeedItem> trendingItems}) = _$FeedResponseImpl;

  factory _FeedResponse.fromJson(Map<String, dynamic> json) =
      _$FeedResponseImpl.fromJson;

  @override
  List<FeedCategory> get categories;
  @override
  @JsonKey(name: 'featured_collections')
  List<FeedCollection> get featuredCollections;
  @override
  @JsonKey(name: 'trending_items')
  List<FeedItem> get trendingItems;

  /// Create a copy of FeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedResponseImplCopyWith<_$FeedResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
