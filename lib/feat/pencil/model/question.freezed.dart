// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  String? get code => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.QUESTIONS_TYPE_QUESTION)
  String? get typeQuestion => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.QUESTIONS_CONTENT_QUESTION)
  String? get contentQuestion => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.QUESTIONS_URL_THUMBNAIL)
  String? get urlThumbnail => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.QUESTIONS_SOLVE_TIME)
  int? get solveTime => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.QUESTIONS_INCORRECT_RATE)
  int? get incorrectRate => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.QUESTIONS_ANSWERS_CORRECT)
  List<String> get answersCorrects => throw _privateConstructorUsedError;
  List<Answer> get answers => throw _privateConstructorUsedError;
  Overview? get overview => throw _privateConstructorUsedError;
  List<StepView>? get stepviews => throw _privateConstructorUsedError;
  List<Solution>? get solutions => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false)
  String? get problemAnswer => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false)
  String? get problemDraw => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {String? code,
      String? title,
      @JsonKey(name: Keys.QUESTIONS_TYPE_QUESTION) String? typeQuestion,
      @JsonKey(name: Keys.QUESTIONS_CONTENT_QUESTION) String? contentQuestion,
      @JsonKey(name: Keys.QUESTIONS_URL_THUMBNAIL) String? urlThumbnail,
      @JsonKey(name: Keys.QUESTIONS_SOLVE_TIME) int? solveTime,
      @JsonKey(name: Keys.QUESTIONS_INCORRECT_RATE) int? incorrectRate,
      @JsonKey(name: Keys.QUESTIONS_ANSWERS_CORRECT)
      List<String> answersCorrects,
      List<Answer> answers,
      Overview? overview,
      List<StepView>? stepviews,
      List<Solution>? solutions,
      @JsonKey(includeFromJson: false) String? problemAnswer,
      @JsonKey(includeFromJson: false) String? problemDraw});

  $OverviewCopyWith<$Res>? get overview;
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? title = freezed,
    Object? typeQuestion = freezed,
    Object? contentQuestion = freezed,
    Object? urlThumbnail = freezed,
    Object? solveTime = freezed,
    Object? incorrectRate = freezed,
    Object? answersCorrects = null,
    Object? answers = null,
    Object? overview = freezed,
    Object? stepviews = freezed,
    Object? solutions = freezed,
    Object? problemAnswer = freezed,
    Object? problemDraw = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      typeQuestion: freezed == typeQuestion
          ? _value.typeQuestion
          : typeQuestion // ignore: cast_nullable_to_non_nullable
              as String?,
      contentQuestion: freezed == contentQuestion
          ? _value.contentQuestion
          : contentQuestion // ignore: cast_nullable_to_non_nullable
              as String?,
      urlThumbnail: freezed == urlThumbnail
          ? _value.urlThumbnail
          : urlThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      solveTime: freezed == solveTime
          ? _value.solveTime
          : solveTime // ignore: cast_nullable_to_non_nullable
              as int?,
      incorrectRate: freezed == incorrectRate
          ? _value.incorrectRate
          : incorrectRate // ignore: cast_nullable_to_non_nullable
              as int?,
      answersCorrects: null == answersCorrects
          ? _value.answersCorrects
          : answersCorrects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as Overview?,
      stepviews: freezed == stepviews
          ? _value.stepviews
          : stepviews // ignore: cast_nullable_to_non_nullable
              as List<StepView>?,
      solutions: freezed == solutions
          ? _value.solutions
          : solutions // ignore: cast_nullable_to_non_nullable
              as List<Solution>?,
      problemAnswer: freezed == problemAnswer
          ? _value.problemAnswer
          : problemAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      problemDraw: freezed == problemDraw
          ? _value.problemDraw
          : problemDraw // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OverviewCopyWith<$Res>? get overview {
    if (_value.overview == null) {
      return null;
    }

    return $OverviewCopyWith<$Res>(_value.overview!, (value) {
      return _then(_value.copyWith(overview: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
          _$QuestionImpl value, $Res Function(_$QuestionImpl) then) =
      __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      String? title,
      @JsonKey(name: Keys.QUESTIONS_TYPE_QUESTION) String? typeQuestion,
      @JsonKey(name: Keys.QUESTIONS_CONTENT_QUESTION) String? contentQuestion,
      @JsonKey(name: Keys.QUESTIONS_URL_THUMBNAIL) String? urlThumbnail,
      @JsonKey(name: Keys.QUESTIONS_SOLVE_TIME) int? solveTime,
      @JsonKey(name: Keys.QUESTIONS_INCORRECT_RATE) int? incorrectRate,
      @JsonKey(name: Keys.QUESTIONS_ANSWERS_CORRECT)
      List<String> answersCorrects,
      List<Answer> answers,
      Overview? overview,
      List<StepView>? stepviews,
      List<Solution>? solutions,
      @JsonKey(includeFromJson: false) String? problemAnswer,
      @JsonKey(includeFromJson: false) String? problemDraw});

  @override
  $OverviewCopyWith<$Res>? get overview;
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
      _$QuestionImpl _value, $Res Function(_$QuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? title = freezed,
    Object? typeQuestion = freezed,
    Object? contentQuestion = freezed,
    Object? urlThumbnail = freezed,
    Object? solveTime = freezed,
    Object? incorrectRate = freezed,
    Object? answersCorrects = null,
    Object? answers = null,
    Object? overview = freezed,
    Object? stepviews = freezed,
    Object? solutions = freezed,
    Object? problemAnswer = freezed,
    Object? problemDraw = freezed,
  }) {
    return _then(_$QuestionImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      typeQuestion: freezed == typeQuestion
          ? _value.typeQuestion
          : typeQuestion // ignore: cast_nullable_to_non_nullable
              as String?,
      contentQuestion: freezed == contentQuestion
          ? _value.contentQuestion
          : contentQuestion // ignore: cast_nullable_to_non_nullable
              as String?,
      urlThumbnail: freezed == urlThumbnail
          ? _value.urlThumbnail
          : urlThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      solveTime: freezed == solveTime
          ? _value.solveTime
          : solveTime // ignore: cast_nullable_to_non_nullable
              as int?,
      incorrectRate: freezed == incorrectRate
          ? _value.incorrectRate
          : incorrectRate // ignore: cast_nullable_to_non_nullable
              as int?,
      answersCorrects: null == answersCorrects
          ? _value._answersCorrects
          : answersCorrects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as Overview?,
      stepviews: freezed == stepviews
          ? _value._stepviews
          : stepviews // ignore: cast_nullable_to_non_nullable
              as List<StepView>?,
      solutions: freezed == solutions
          ? _value._solutions
          : solutions // ignore: cast_nullable_to_non_nullable
              as List<Solution>?,
      problemAnswer: freezed == problemAnswer
          ? _value.problemAnswer
          : problemAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      problemDraw: freezed == problemDraw
          ? _value.problemDraw
          : problemDraw // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionImpl implements _Question {
  _$QuestionImpl(
      {this.code,
      this.title,
      @JsonKey(name: Keys.QUESTIONS_TYPE_QUESTION) this.typeQuestion,
      @JsonKey(name: Keys.QUESTIONS_CONTENT_QUESTION) this.contentQuestion,
      @JsonKey(name: Keys.QUESTIONS_URL_THUMBNAIL) this.urlThumbnail,
      @JsonKey(name: Keys.QUESTIONS_SOLVE_TIME) this.solveTime,
      @JsonKey(name: Keys.QUESTIONS_INCORRECT_RATE) this.incorrectRate,
      @JsonKey(name: Keys.QUESTIONS_ANSWERS_CORRECT)
      required final List<String> answersCorrects,
      required final List<Answer> answers,
      this.overview,
      final List<StepView>? stepviews,
      final List<Solution>? solutions,
      @JsonKey(includeFromJson: false) this.problemAnswer,
      @JsonKey(includeFromJson: false) this.problemDraw})
      : _answersCorrects = answersCorrects,
        _answers = answers,
        _stepviews = stepviews,
        _solutions = solutions;

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

  @override
  final String? code;
  @override
  final String? title;
  @override
  @JsonKey(name: Keys.QUESTIONS_TYPE_QUESTION)
  final String? typeQuestion;
  @override
  @JsonKey(name: Keys.QUESTIONS_CONTENT_QUESTION)
  final String? contentQuestion;
  @override
  @JsonKey(name: Keys.QUESTIONS_URL_THUMBNAIL)
  final String? urlThumbnail;
  @override
  @JsonKey(name: Keys.QUESTIONS_SOLVE_TIME)
  final int? solveTime;
  @override
  @JsonKey(name: Keys.QUESTIONS_INCORRECT_RATE)
  final int? incorrectRate;
  final List<String> _answersCorrects;
  @override
  @JsonKey(name: Keys.QUESTIONS_ANSWERS_CORRECT)
  List<String> get answersCorrects {
    if (_answersCorrects is EqualUnmodifiableListView) return _answersCorrects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answersCorrects);
  }

  final List<Answer> _answers;
  @override
  List<Answer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final Overview? overview;
  final List<StepView>? _stepviews;
  @override
  List<StepView>? get stepviews {
    final value = _stepviews;
    if (value == null) return null;
    if (_stepviews is EqualUnmodifiableListView) return _stepviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Solution>? _solutions;
  @override
  List<Solution>? get solutions {
    final value = _solutions;
    if (value == null) return null;
    if (_solutions is EqualUnmodifiableListView) return _solutions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(includeFromJson: false)
  final String? problemAnswer;
  @override
  @JsonKey(includeFromJson: false)
  final String? problemDraw;

  @override
  String toString() {
    return 'Question(code: $code, title: $title, typeQuestion: $typeQuestion, contentQuestion: $contentQuestion, urlThumbnail: $urlThumbnail, solveTime: $solveTime, incorrectRate: $incorrectRate, answersCorrects: $answersCorrects, answers: $answers, overview: $overview, stepviews: $stepviews, solutions: $solutions, problemAnswer: $problemAnswer, problemDraw: $problemDraw)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.typeQuestion, typeQuestion) ||
                other.typeQuestion == typeQuestion) &&
            (identical(other.contentQuestion, contentQuestion) ||
                other.contentQuestion == contentQuestion) &&
            (identical(other.urlThumbnail, urlThumbnail) ||
                other.urlThumbnail == urlThumbnail) &&
            (identical(other.solveTime, solveTime) ||
                other.solveTime == solveTime) &&
            (identical(other.incorrectRate, incorrectRate) ||
                other.incorrectRate == incorrectRate) &&
            const DeepCollectionEquality()
                .equals(other._answersCorrects, _answersCorrects) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            const DeepCollectionEquality()
                .equals(other._stepviews, _stepviews) &&
            const DeepCollectionEquality()
                .equals(other._solutions, _solutions) &&
            (identical(other.problemAnswer, problemAnswer) ||
                other.problemAnswer == problemAnswer) &&
            (identical(other.problemDraw, problemDraw) ||
                other.problemDraw == problemDraw));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      title,
      typeQuestion,
      contentQuestion,
      urlThumbnail,
      solveTime,
      incorrectRate,
      const DeepCollectionEquality().hash(_answersCorrects),
      const DeepCollectionEquality().hash(_answers),
      overview,
      const DeepCollectionEquality().hash(_stepviews),
      const DeepCollectionEquality().hash(_solutions),
      problemAnswer,
      problemDraw);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionImplToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  factory _Question(
      {final String? code,
      final String? title,
      @JsonKey(name: Keys.QUESTIONS_TYPE_QUESTION) final String? typeQuestion,
      @JsonKey(name: Keys.QUESTIONS_CONTENT_QUESTION)
      final String? contentQuestion,
      @JsonKey(name: Keys.QUESTIONS_URL_THUMBNAIL) final String? urlThumbnail,
      @JsonKey(name: Keys.QUESTIONS_SOLVE_TIME) final int? solveTime,
      @JsonKey(name: Keys.QUESTIONS_INCORRECT_RATE) final int? incorrectRate,
      @JsonKey(name: Keys.QUESTIONS_ANSWERS_CORRECT)
      required final List<String> answersCorrects,
      required final List<Answer> answers,
      final Overview? overview,
      final List<StepView>? stepviews,
      final List<Solution>? solutions,
      @JsonKey(includeFromJson: false) final String? problemAnswer,
      @JsonKey(includeFromJson: false)
      final String? problemDraw}) = _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  @override
  String? get code;
  @override
  String? get title;
  @override
  @JsonKey(name: Keys.QUESTIONS_TYPE_QUESTION)
  String? get typeQuestion;
  @override
  @JsonKey(name: Keys.QUESTIONS_CONTENT_QUESTION)
  String? get contentQuestion;
  @override
  @JsonKey(name: Keys.QUESTIONS_URL_THUMBNAIL)
  String? get urlThumbnail;
  @override
  @JsonKey(name: Keys.QUESTIONS_SOLVE_TIME)
  int? get solveTime;
  @override
  @JsonKey(name: Keys.QUESTIONS_INCORRECT_RATE)
  int? get incorrectRate;
  @override
  @JsonKey(name: Keys.QUESTIONS_ANSWERS_CORRECT)
  List<String> get answersCorrects;
  @override
  List<Answer> get answers;
  @override
  Overview? get overview;
  @override
  List<StepView>? get stepviews;
  @override
  List<Solution>? get solutions;
  @override
  @JsonKey(includeFromJson: false)
  String? get problemAnswer;
  @override
  @JsonKey(includeFromJson: false)
  String? get problemDraw;
  @override
  @JsonKey(ignore: true)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
