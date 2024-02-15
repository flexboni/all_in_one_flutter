// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Solution _$SolutionFromJson(Map<String, dynamic> json) {
  return _Solution.fromJson(json);
}

/// @nodoc
mixin _$Solution {
  String? get comment => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.SOLUTIONS_QUESTION_CODE)
  String? get questionCode => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  List<Lecture>? get lectures => throw _privateConstructorUsedError;
  List<SolutionStep>? get steps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolutionCopyWith<Solution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolutionCopyWith<$Res> {
  factory $SolutionCopyWith(Solution value, $Res Function(Solution) then) =
      _$SolutionCopyWithImpl<$Res, Solution>;
  @useResult
  $Res call(
      {String? comment,
      @JsonKey(name: Keys.SOLUTIONS_QUESTION_CODE) String? questionCode,
      String? code,
      List<Lecture>? lectures,
      List<SolutionStep>? steps});
}

/// @nodoc
class _$SolutionCopyWithImpl<$Res, $Val extends Solution>
    implements $SolutionCopyWith<$Res> {
  _$SolutionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = freezed,
    Object? questionCode = freezed,
    Object? code = freezed,
    Object? lectures = freezed,
    Object? steps = freezed,
  }) {
    return _then(_value.copyWith(
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      questionCode: freezed == questionCode
          ? _value.questionCode
          : questionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      lectures: freezed == lectures
          ? _value.lectures
          : lectures // ignore: cast_nullable_to_non_nullable
              as List<Lecture>?,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<SolutionStep>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SolutionImplCopyWith<$Res>
    implements $SolutionCopyWith<$Res> {
  factory _$$SolutionImplCopyWith(
          _$SolutionImpl value, $Res Function(_$SolutionImpl) then) =
      __$$SolutionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? comment,
      @JsonKey(name: Keys.SOLUTIONS_QUESTION_CODE) String? questionCode,
      String? code,
      List<Lecture>? lectures,
      List<SolutionStep>? steps});
}

/// @nodoc
class __$$SolutionImplCopyWithImpl<$Res>
    extends _$SolutionCopyWithImpl<$Res, _$SolutionImpl>
    implements _$$SolutionImplCopyWith<$Res> {
  __$$SolutionImplCopyWithImpl(
      _$SolutionImpl _value, $Res Function(_$SolutionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = freezed,
    Object? questionCode = freezed,
    Object? code = freezed,
    Object? lectures = freezed,
    Object? steps = freezed,
  }) {
    return _then(_$SolutionImpl(
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      questionCode: freezed == questionCode
          ? _value.questionCode
          : questionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      lectures: freezed == lectures
          ? _value._lectures
          : lectures // ignore: cast_nullable_to_non_nullable
              as List<Lecture>?,
      steps: freezed == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<SolutionStep>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SolutionImpl implements _Solution {
  const _$SolutionImpl(
      {this.comment,
      @JsonKey(name: Keys.SOLUTIONS_QUESTION_CODE) this.questionCode,
      this.code,
      final List<Lecture>? lectures,
      final List<SolutionStep>? steps})
      : _lectures = lectures,
        _steps = steps;

  factory _$SolutionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SolutionImplFromJson(json);

  @override
  final String? comment;
  @override
  @JsonKey(name: Keys.SOLUTIONS_QUESTION_CODE)
  final String? questionCode;
  @override
  final String? code;
  final List<Lecture>? _lectures;
  @override
  List<Lecture>? get lectures {
    final value = _lectures;
    if (value == null) return null;
    if (_lectures is EqualUnmodifiableListView) return _lectures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SolutionStep>? _steps;
  @override
  List<SolutionStep>? get steps {
    final value = _steps;
    if (value == null) return null;
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Solution(comment: $comment, questionCode: $questionCode, code: $code, lectures: $lectures, steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SolutionImpl &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.questionCode, questionCode) ||
                other.questionCode == questionCode) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._lectures, _lectures) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      comment,
      questionCode,
      code,
      const DeepCollectionEquality().hash(_lectures),
      const DeepCollectionEquality().hash(_steps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SolutionImplCopyWith<_$SolutionImpl> get copyWith =>
      __$$SolutionImplCopyWithImpl<_$SolutionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SolutionImplToJson(
      this,
    );
  }
}

abstract class _Solution implements Solution {
  const factory _Solution(
      {final String? comment,
      @JsonKey(name: Keys.SOLUTIONS_QUESTION_CODE) final String? questionCode,
      final String? code,
      final List<Lecture>? lectures,
      final List<SolutionStep>? steps}) = _$SolutionImpl;

  factory _Solution.fromJson(Map<String, dynamic> json) =
      _$SolutionImpl.fromJson;

  @override
  String? get comment;
  @override
  @JsonKey(name: Keys.SOLUTIONS_QUESTION_CODE)
  String? get questionCode;
  @override
  String? get code;
  @override
  List<Lecture>? get lectures;
  @override
  List<SolutionStep>? get steps;
  @override
  @JsonKey(ignore: true)
  _$$SolutionImplCopyWith<_$SolutionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
