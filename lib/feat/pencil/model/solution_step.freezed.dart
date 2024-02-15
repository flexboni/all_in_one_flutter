// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solution_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SolutionStep _$SolutionStepFromJson(Map<String, dynamic> json) {
  return _SolutionStep.fromJson(json);
}

/// @nodoc
mixin _$SolutionStep {
  String? get code => throw _privateConstructorUsedError;
  int? get step => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.SOLUTION_STEPS_CONTENT_SOLUTION)
  String? get contentSolution => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.SOLUTION_STEPS_EDITOR_SOLUTION)
  String? get editorSolution => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.SOLUTION_STEPS_LATEX_SOLUTION)
  String? get latexSolution => throw _privateConstructorUsedError;
  List<Lecture>? get lectures => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolutionStepCopyWith<SolutionStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolutionStepCopyWith<$Res> {
  factory $SolutionStepCopyWith(
          SolutionStep value, $Res Function(SolutionStep) then) =
      _$SolutionStepCopyWithImpl<$Res, SolutionStep>;
  @useResult
  $Res call(
      {String? code,
      int? step,
      String? comment,
      @JsonKey(name: Keys.SOLUTION_STEPS_CONTENT_SOLUTION)
      String? contentSolution,
      @JsonKey(name: Keys.SOLUTION_STEPS_EDITOR_SOLUTION)
      String? editorSolution,
      @JsonKey(name: Keys.SOLUTION_STEPS_LATEX_SOLUTION) String? latexSolution,
      List<Lecture>? lectures});
}

/// @nodoc
class _$SolutionStepCopyWithImpl<$Res, $Val extends SolutionStep>
    implements $SolutionStepCopyWith<$Res> {
  _$SolutionStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? step = freezed,
    Object? comment = freezed,
    Object? contentSolution = freezed,
    Object? editorSolution = freezed,
    Object? latexSolution = freezed,
    Object? lectures = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      contentSolution: freezed == contentSolution
          ? _value.contentSolution
          : contentSolution // ignore: cast_nullable_to_non_nullable
              as String?,
      editorSolution: freezed == editorSolution
          ? _value.editorSolution
          : editorSolution // ignore: cast_nullable_to_non_nullable
              as String?,
      latexSolution: freezed == latexSolution
          ? _value.latexSolution
          : latexSolution // ignore: cast_nullable_to_non_nullable
              as String?,
      lectures: freezed == lectures
          ? _value.lectures
          : lectures // ignore: cast_nullable_to_non_nullable
              as List<Lecture>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SolutionStepImplCopyWith<$Res>
    implements $SolutionStepCopyWith<$Res> {
  factory _$$SolutionStepImplCopyWith(
          _$SolutionStepImpl value, $Res Function(_$SolutionStepImpl) then) =
      __$$SolutionStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      int? step,
      String? comment,
      @JsonKey(name: Keys.SOLUTION_STEPS_CONTENT_SOLUTION)
      String? contentSolution,
      @JsonKey(name: Keys.SOLUTION_STEPS_EDITOR_SOLUTION)
      String? editorSolution,
      @JsonKey(name: Keys.SOLUTION_STEPS_LATEX_SOLUTION) String? latexSolution,
      List<Lecture>? lectures});
}

/// @nodoc
class __$$SolutionStepImplCopyWithImpl<$Res>
    extends _$SolutionStepCopyWithImpl<$Res, _$SolutionStepImpl>
    implements _$$SolutionStepImplCopyWith<$Res> {
  __$$SolutionStepImplCopyWithImpl(
      _$SolutionStepImpl _value, $Res Function(_$SolutionStepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? step = freezed,
    Object? comment = freezed,
    Object? contentSolution = freezed,
    Object? editorSolution = freezed,
    Object? latexSolution = freezed,
    Object? lectures = freezed,
  }) {
    return _then(_$SolutionStepImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      contentSolution: freezed == contentSolution
          ? _value.contentSolution
          : contentSolution // ignore: cast_nullable_to_non_nullable
              as String?,
      editorSolution: freezed == editorSolution
          ? _value.editorSolution
          : editorSolution // ignore: cast_nullable_to_non_nullable
              as String?,
      latexSolution: freezed == latexSolution
          ? _value.latexSolution
          : latexSolution // ignore: cast_nullable_to_non_nullable
              as String?,
      lectures: freezed == lectures
          ? _value._lectures
          : lectures // ignore: cast_nullable_to_non_nullable
              as List<Lecture>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SolutionStepImpl implements _SolutionStep {
  const _$SolutionStepImpl(
      {this.code,
      this.step,
      this.comment,
      @JsonKey(name: Keys.SOLUTION_STEPS_CONTENT_SOLUTION) this.contentSolution,
      @JsonKey(name: Keys.SOLUTION_STEPS_EDITOR_SOLUTION) this.editorSolution,
      @JsonKey(name: Keys.SOLUTION_STEPS_LATEX_SOLUTION) this.latexSolution,
      final List<Lecture>? lectures})
      : _lectures = lectures;

  factory _$SolutionStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$SolutionStepImplFromJson(json);

  @override
  final String? code;
  @override
  final int? step;
  @override
  final String? comment;
  @override
  @JsonKey(name: Keys.SOLUTION_STEPS_CONTENT_SOLUTION)
  final String? contentSolution;
  @override
  @JsonKey(name: Keys.SOLUTION_STEPS_EDITOR_SOLUTION)
  final String? editorSolution;
  @override
  @JsonKey(name: Keys.SOLUTION_STEPS_LATEX_SOLUTION)
  final String? latexSolution;
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
    return 'SolutionStep(code: $code, step: $step, comment: $comment, contentSolution: $contentSolution, editorSolution: $editorSolution, latexSolution: $latexSolution, lectures: $lectures)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SolutionStepImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.contentSolution, contentSolution) ||
                other.contentSolution == contentSolution) &&
            (identical(other.editorSolution, editorSolution) ||
                other.editorSolution == editorSolution) &&
            (identical(other.latexSolution, latexSolution) ||
                other.latexSolution == latexSolution) &&
            const DeepCollectionEquality().equals(other._lectures, _lectures));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      step,
      comment,
      contentSolution,
      editorSolution,
      latexSolution,
      const DeepCollectionEquality().hash(_lectures));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SolutionStepImplCopyWith<_$SolutionStepImpl> get copyWith =>
      __$$SolutionStepImplCopyWithImpl<_$SolutionStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SolutionStepImplToJson(
      this,
    );
  }
}

abstract class _SolutionStep implements SolutionStep {
  const factory _SolutionStep(
      {final String? code,
      final int? step,
      final String? comment,
      @JsonKey(name: Keys.SOLUTION_STEPS_CONTENT_SOLUTION)
      final String? contentSolution,
      @JsonKey(name: Keys.SOLUTION_STEPS_EDITOR_SOLUTION)
      final String? editorSolution,
      @JsonKey(name: Keys.SOLUTION_STEPS_LATEX_SOLUTION)
      final String? latexSolution,
      final List<Lecture>? lectures}) = _$SolutionStepImpl;

  factory _SolutionStep.fromJson(Map<String, dynamic> json) =
      _$SolutionStepImpl.fromJson;

  @override
  String? get code;
  @override
  int? get step;
  @override
  String? get comment;
  @override
  @JsonKey(name: Keys.SOLUTION_STEPS_CONTENT_SOLUTION)
  String? get contentSolution;
  @override
  @JsonKey(name: Keys.SOLUTION_STEPS_EDITOR_SOLUTION)
  String? get editorSolution;
  @override
  @JsonKey(name: Keys.SOLUTION_STEPS_LATEX_SOLUTION)
  String? get latexSolution;
  @override
  List<Lecture>? get lectures;
  @override
  @JsonKey(ignore: true)
  _$$SolutionStepImplCopyWith<_$SolutionStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
