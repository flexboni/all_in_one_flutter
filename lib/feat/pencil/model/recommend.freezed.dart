// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommend.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Recommend _$RecommendFromJson(Map<String, dynamic> json) {
  return _Recommend.fromJson(json);
}

/// @nodoc
mixin _$Recommend {
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.RECOMMENDS_TYPE_RECOMMEND)
  String? get typeRecommend => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.RECOMMENDS_TIME_RECOMMEND)
  int? get timeRecommend => throw _privateConstructorUsedError;
  List<Lecture>? get lectures => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecommendCopyWith<Recommend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendCopyWith<$Res> {
  factory $RecommendCopyWith(Recommend value, $Res Function(Recommend) then) =
      _$RecommendCopyWithImpl<$Res, Recommend>;
  @useResult
  $Res call(
      {String? code,
      @JsonKey(name: Keys.RECOMMENDS_TYPE_RECOMMEND) String? typeRecommend,
      @JsonKey(name: Keys.RECOMMENDS_TIME_RECOMMEND) int? timeRecommend,
      List<Lecture>? lectures});
}

/// @nodoc
class _$RecommendCopyWithImpl<$Res, $Val extends Recommend>
    implements $RecommendCopyWith<$Res> {
  _$RecommendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? typeRecommend = freezed,
    Object? timeRecommend = freezed,
    Object? lectures = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      typeRecommend: freezed == typeRecommend
          ? _value.typeRecommend
          : typeRecommend // ignore: cast_nullable_to_non_nullable
              as String?,
      timeRecommend: freezed == timeRecommend
          ? _value.timeRecommend
          : timeRecommend // ignore: cast_nullable_to_non_nullable
              as int?,
      lectures: freezed == lectures
          ? _value.lectures
          : lectures // ignore: cast_nullable_to_non_nullable
              as List<Lecture>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendImplCopyWith<$Res>
    implements $RecommendCopyWith<$Res> {
  factory _$$RecommendImplCopyWith(
          _$RecommendImpl value, $Res Function(_$RecommendImpl) then) =
      __$$RecommendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      @JsonKey(name: Keys.RECOMMENDS_TYPE_RECOMMEND) String? typeRecommend,
      @JsonKey(name: Keys.RECOMMENDS_TIME_RECOMMEND) int? timeRecommend,
      List<Lecture>? lectures});
}

/// @nodoc
class __$$RecommendImplCopyWithImpl<$Res>
    extends _$RecommendCopyWithImpl<$Res, _$RecommendImpl>
    implements _$$RecommendImplCopyWith<$Res> {
  __$$RecommendImplCopyWithImpl(
      _$RecommendImpl _value, $Res Function(_$RecommendImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? typeRecommend = freezed,
    Object? timeRecommend = freezed,
    Object? lectures = freezed,
  }) {
    return _then(_$RecommendImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      typeRecommend: freezed == typeRecommend
          ? _value.typeRecommend
          : typeRecommend // ignore: cast_nullable_to_non_nullable
              as String?,
      timeRecommend: freezed == timeRecommend
          ? _value.timeRecommend
          : timeRecommend // ignore: cast_nullable_to_non_nullable
              as int?,
      lectures: freezed == lectures
          ? _value._lectures
          : lectures // ignore: cast_nullable_to_non_nullable
              as List<Lecture>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendImpl implements _Recommend {
  const _$RecommendImpl(
      {this.code,
      @JsonKey(name: Keys.RECOMMENDS_TYPE_RECOMMEND) this.typeRecommend,
      @JsonKey(name: Keys.RECOMMENDS_TIME_RECOMMEND) this.timeRecommend,
      final List<Lecture>? lectures})
      : _lectures = lectures;

  factory _$RecommendImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendImplFromJson(json);

  @override
  final String? code;
  @override
  @JsonKey(name: Keys.RECOMMENDS_TYPE_RECOMMEND)
  final String? typeRecommend;
  @override
  @JsonKey(name: Keys.RECOMMENDS_TIME_RECOMMEND)
  final int? timeRecommend;
  final List<Lecture>? _lectures;
  @override
  List<Lecture>? get lectures {
    final value = _lectures;
    if (value == null) return null;
    if (_lectures is EqualUnmodifiableListView) return _lectures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Recommend(code: $code, typeRecommend: $typeRecommend, timeRecommend: $timeRecommend, lectures: $lectures)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.typeRecommend, typeRecommend) ||
                other.typeRecommend == typeRecommend) &&
            (identical(other.timeRecommend, timeRecommend) ||
                other.timeRecommend == timeRecommend) &&
            const DeepCollectionEquality().equals(other._lectures, _lectures));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, typeRecommend,
      timeRecommend, const DeepCollectionEquality().hash(_lectures));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendImplCopyWith<_$RecommendImpl> get copyWith =>
      __$$RecommendImplCopyWithImpl<_$RecommendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendImplToJson(
      this,
    );
  }
}

abstract class _Recommend implements Recommend {
  const factory _Recommend(
      {final String? code,
      @JsonKey(name: Keys.RECOMMENDS_TYPE_RECOMMEND)
      final String? typeRecommend,
      @JsonKey(name: Keys.RECOMMENDS_TIME_RECOMMEND) final int? timeRecommend,
      final List<Lecture>? lectures}) = _$RecommendImpl;

  factory _Recommend.fromJson(Map<String, dynamic> json) =
      _$RecommendImpl.fromJson;

  @override
  String? get code;
  @override
  @JsonKey(name: Keys.RECOMMENDS_TYPE_RECOMMEND)
  String? get typeRecommend;
  @override
  @JsonKey(name: Keys.RECOMMENDS_TIME_RECOMMEND)
  int? get timeRecommend;
  @override
  List<Lecture>? get lectures;
  @override
  @JsonKey(ignore: true)
  _$$RecommendImplCopyWith<_$RecommendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
