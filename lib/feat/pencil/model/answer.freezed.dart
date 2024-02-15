// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {
  @JsonKey(name: Keys.ANSWER_ANSWER_NO)
  int? get answerNo => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.ANSWER_CONTENT_ANSWER)
  String? get contentAnswer => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.ANSWER_EDITOR_ANSWER)
  String? get editorAnswer => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.ANSWER_CORRECT_ANSWER)
  String? get correctAnswer => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.ANSWER_IS_CORRECT)
  Correct? get isCorrect => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.ANSWER_QUESTION_CODE)
  String? get questionCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res, Answer>;
  @useResult
  $Res call(
      {@JsonKey(name: Keys.ANSWER_ANSWER_NO) int? answerNo,
      @JsonKey(name: Keys.ANSWER_CONTENT_ANSWER) String? contentAnswer,
      @JsonKey(name: Keys.ANSWER_EDITOR_ANSWER) String? editorAnswer,
      @JsonKey(name: Keys.ANSWER_CORRECT_ANSWER) String? correctAnswer,
      @JsonKey(name: Keys.ANSWER_IS_CORRECT) Correct? isCorrect,
      String? code,
      @JsonKey(name: Keys.ANSWER_QUESTION_CODE) String? questionCode});
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res, $Val extends Answer>
    implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerNo = freezed,
    Object? contentAnswer = freezed,
    Object? editorAnswer = freezed,
    Object? correctAnswer = freezed,
    Object? isCorrect = freezed,
    Object? code = freezed,
    Object? questionCode = freezed,
  }) {
    return _then(_value.copyWith(
      answerNo: freezed == answerNo
          ? _value.answerNo
          : answerNo // ignore: cast_nullable_to_non_nullable
              as int?,
      contentAnswer: freezed == contentAnswer
          ? _value.contentAnswer
          : contentAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      editorAnswer: freezed == editorAnswer
          ? _value.editorAnswer
          : editorAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswer: freezed == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: freezed == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as Correct?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      questionCode: freezed == questionCode
          ? _value.questionCode
          : questionCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerImplCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$AnswerImplCopyWith(
          _$AnswerImpl value, $Res Function(_$AnswerImpl) then) =
      __$$AnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: Keys.ANSWER_ANSWER_NO) int? answerNo,
      @JsonKey(name: Keys.ANSWER_CONTENT_ANSWER) String? contentAnswer,
      @JsonKey(name: Keys.ANSWER_EDITOR_ANSWER) String? editorAnswer,
      @JsonKey(name: Keys.ANSWER_CORRECT_ANSWER) String? correctAnswer,
      @JsonKey(name: Keys.ANSWER_IS_CORRECT) Correct? isCorrect,
      String? code,
      @JsonKey(name: Keys.ANSWER_QUESTION_CODE) String? questionCode});
}

/// @nodoc
class __$$AnswerImplCopyWithImpl<$Res>
    extends _$AnswerCopyWithImpl<$Res, _$AnswerImpl>
    implements _$$AnswerImplCopyWith<$Res> {
  __$$AnswerImplCopyWithImpl(
      _$AnswerImpl _value, $Res Function(_$AnswerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerNo = freezed,
    Object? contentAnswer = freezed,
    Object? editorAnswer = freezed,
    Object? correctAnswer = freezed,
    Object? isCorrect = freezed,
    Object? code = freezed,
    Object? questionCode = freezed,
  }) {
    return _then(_$AnswerImpl(
      answerNo: freezed == answerNo
          ? _value.answerNo
          : answerNo // ignore: cast_nullable_to_non_nullable
              as int?,
      contentAnswer: freezed == contentAnswer
          ? _value.contentAnswer
          : contentAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      editorAnswer: freezed == editorAnswer
          ? _value.editorAnswer
          : editorAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswer: freezed == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: freezed == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as Correct?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      questionCode: freezed == questionCode
          ? _value.questionCode
          : questionCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerImpl implements _Answer {
  const _$AnswerImpl(
      {@JsonKey(name: Keys.ANSWER_ANSWER_NO) this.answerNo,
      @JsonKey(name: Keys.ANSWER_CONTENT_ANSWER) this.contentAnswer,
      @JsonKey(name: Keys.ANSWER_EDITOR_ANSWER) this.editorAnswer,
      @JsonKey(name: Keys.ANSWER_CORRECT_ANSWER) this.correctAnswer,
      @JsonKey(name: Keys.ANSWER_IS_CORRECT) this.isCorrect,
      this.code,
      @JsonKey(name: Keys.ANSWER_QUESTION_CODE) this.questionCode});

  factory _$AnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerImplFromJson(json);

  @override
  @JsonKey(name: Keys.ANSWER_ANSWER_NO)
  final int? answerNo;
  @override
  @JsonKey(name: Keys.ANSWER_CONTENT_ANSWER)
  final String? contentAnswer;
  @override
  @JsonKey(name: Keys.ANSWER_EDITOR_ANSWER)
  final String? editorAnswer;
  @override
  @JsonKey(name: Keys.ANSWER_CORRECT_ANSWER)
  final String? correctAnswer;
  @override
  @JsonKey(name: Keys.ANSWER_IS_CORRECT)
  final Correct? isCorrect;
  @override
  final String? code;
  @override
  @JsonKey(name: Keys.ANSWER_QUESTION_CODE)
  final String? questionCode;

  @override
  String toString() {
    return 'Answer(answerNo: $answerNo, contentAnswer: $contentAnswer, editorAnswer: $editorAnswer, correctAnswer: $correctAnswer, isCorrect: $isCorrect, code: $code, questionCode: $questionCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerImpl &&
            (identical(other.answerNo, answerNo) ||
                other.answerNo == answerNo) &&
            (identical(other.contentAnswer, contentAnswer) ||
                other.contentAnswer == contentAnswer) &&
            (identical(other.editorAnswer, editorAnswer) ||
                other.editorAnswer == editorAnswer) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.questionCode, questionCode) ||
                other.questionCode == questionCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, answerNo, contentAnswer,
      editorAnswer, correctAnswer, isCorrect, code, questionCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      __$$AnswerImplCopyWithImpl<_$AnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerImplToJson(
      this,
    );
  }
}

abstract class _Answer implements Answer {
  const factory _Answer(
      {@JsonKey(name: Keys.ANSWER_ANSWER_NO) final int? answerNo,
      @JsonKey(name: Keys.ANSWER_CONTENT_ANSWER) final String? contentAnswer,
      @JsonKey(name: Keys.ANSWER_EDITOR_ANSWER) final String? editorAnswer,
      @JsonKey(name: Keys.ANSWER_CORRECT_ANSWER) final String? correctAnswer,
      @JsonKey(name: Keys.ANSWER_IS_CORRECT) final Correct? isCorrect,
      final String? code,
      @JsonKey(name: Keys.ANSWER_QUESTION_CODE)
      final String? questionCode}) = _$AnswerImpl;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$AnswerImpl.fromJson;

  @override
  @JsonKey(name: Keys.ANSWER_ANSWER_NO)
  int? get answerNo;
  @override
  @JsonKey(name: Keys.ANSWER_CONTENT_ANSWER)
  String? get contentAnswer;
  @override
  @JsonKey(name: Keys.ANSWER_EDITOR_ANSWER)
  String? get editorAnswer;
  @override
  @JsonKey(name: Keys.ANSWER_CORRECT_ANSWER)
  String? get correctAnswer;
  @override
  @JsonKey(name: Keys.ANSWER_IS_CORRECT)
  Correct? get isCorrect;
  @override
  String? get code;
  @override
  @JsonKey(name: Keys.ANSWER_QUESTION_CODE)
  String? get questionCode;
  @override
  @JsonKey(ignore: true)
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
