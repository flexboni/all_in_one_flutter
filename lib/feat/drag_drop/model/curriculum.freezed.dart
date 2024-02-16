// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curriculum.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Curriculum _$CurriculumFromJson(Map<String, dynamic> json) {
  return _Curriculum.fromJson(json);
}

/// @nodoc
mixin _$Curriculum {
  String get code => throw _privateConstructorUsedError;
  String get grade => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  int get day => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurriculumCopyWith<Curriculum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurriculumCopyWith<$Res> {
  factory $CurriculumCopyWith(
          Curriculum value, $Res Function(Curriculum) then) =
      _$CurriculumCopyWithImpl<$Res, Curriculum>;
  @useResult
  $Res call({String code, String grade, String title, int count, int day});
}

/// @nodoc
class _$CurriculumCopyWithImpl<$Res, $Val extends Curriculum>
    implements $CurriculumCopyWith<$Res> {
  _$CurriculumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? grade = null,
    Object? title = null,
    Object? count = null,
    Object? day = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurriculumImplCopyWith<$Res>
    implements $CurriculumCopyWith<$Res> {
  factory _$$CurriculumImplCopyWith(
          _$CurriculumImpl value, $Res Function(_$CurriculumImpl) then) =
      __$$CurriculumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String grade, String title, int count, int day});
}

/// @nodoc
class __$$CurriculumImplCopyWithImpl<$Res>
    extends _$CurriculumCopyWithImpl<$Res, _$CurriculumImpl>
    implements _$$CurriculumImplCopyWith<$Res> {
  __$$CurriculumImplCopyWithImpl(
      _$CurriculumImpl _value, $Res Function(_$CurriculumImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? grade = null,
    Object? title = null,
    Object? count = null,
    Object? day = null,
  }) {
    return _then(_$CurriculumImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurriculumImpl implements _Curriculum {
  const _$CurriculumImpl(
      {required this.code,
      required this.grade,
      required this.title,
      required this.count,
      required this.day});

  factory _$CurriculumImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurriculumImplFromJson(json);

  @override
  final String code;
  @override
  final String grade;
  @override
  final String title;
  @override
  final int count;
  @override
  final int day;

  @override
  String toString() {
    return 'Curriculum(code: $code, grade: $grade, title: $title, count: $count, day: $day)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurriculumImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.day, day) || other.day == day));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, grade, title, count, day);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurriculumImplCopyWith<_$CurriculumImpl> get copyWith =>
      __$$CurriculumImplCopyWithImpl<_$CurriculumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurriculumImplToJson(
      this,
    );
  }
}

abstract class _Curriculum implements Curriculum {
  const factory _Curriculum(
      {required final String code,
      required final String grade,
      required final String title,
      required final int count,
      required final int day}) = _$CurriculumImpl;

  factory _Curriculum.fromJson(Map<String, dynamic> json) =
      _$CurriculumImpl.fromJson;

  @override
  String get code;
  @override
  String get grade;
  @override
  String get title;
  @override
  int get count;
  @override
  int get day;
  @override
  @JsonKey(ignore: true)
  _$$CurriculumImplCopyWith<_$CurriculumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
