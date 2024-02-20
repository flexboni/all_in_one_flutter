// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curriculum_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurriculumData _$CurriculumDataFromJson(Map<String, dynamic> json) {
  return _CurriculumData.fromJson(json);
}

/// @nodoc
mixin _$CurriculumData {
  String get title => throw _privateConstructorUsedError;
  List<Curriculum> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurriculumDataCopyWith<CurriculumData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurriculumDataCopyWith<$Res> {
  factory $CurriculumDataCopyWith(
          CurriculumData value, $Res Function(CurriculumData) then) =
      _$CurriculumDataCopyWithImpl<$Res, CurriculumData>;
  @useResult
  $Res call({String title, List<Curriculum> items});
}

/// @nodoc
class _$CurriculumDataCopyWithImpl<$Res, $Val extends CurriculumData>
    implements $CurriculumDataCopyWith<$Res> {
  _$CurriculumDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Curriculum>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurriculumDataImplCopyWith<$Res>
    implements $CurriculumDataCopyWith<$Res> {
  factory _$$CurriculumDataImplCopyWith(_$CurriculumDataImpl value,
          $Res Function(_$CurriculumDataImpl) then) =
      __$$CurriculumDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<Curriculum> items});
}

/// @nodoc
class __$$CurriculumDataImplCopyWithImpl<$Res>
    extends _$CurriculumDataCopyWithImpl<$Res, _$CurriculumDataImpl>
    implements _$$CurriculumDataImplCopyWith<$Res> {
  __$$CurriculumDataImplCopyWithImpl(
      _$CurriculumDataImpl _value, $Res Function(_$CurriculumDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? items = null,
  }) {
    return _then(_$CurriculumDataImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Curriculum>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurriculumDataImpl implements _CurriculumData {
  const _$CurriculumDataImpl(
      {required this.title, required final List<Curriculum> items})
      : _items = items;

  factory _$CurriculumDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurriculumDataImplFromJson(json);

  @override
  final String title;
  final List<Curriculum> _items;
  @override
  List<Curriculum> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CurriculumData(title: $title, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurriculumDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurriculumDataImplCopyWith<_$CurriculumDataImpl> get copyWith =>
      __$$CurriculumDataImplCopyWithImpl<_$CurriculumDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurriculumDataImplToJson(
      this,
    );
  }
}

abstract class _CurriculumData implements CurriculumData {
  const factory _CurriculumData(
      {required final String title,
      required final List<Curriculum> items}) = _$CurriculumDataImpl;

  factory _CurriculumData.fromJson(Map<String, dynamic> json) =
      _$CurriculumDataImpl.fromJson;

  @override
  String get title;
  @override
  List<Curriculum> get items;
  @override
  @JsonKey(ignore: true)
  _$$CurriculumDataImplCopyWith<_$CurriculumDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
