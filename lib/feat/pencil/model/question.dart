import 'package:all_in_one_flutter/constant/keys.dart';
import 'package:all_in_one_flutter/feat/pencil/model/answer.dart';
import 'package:all_in_one_flutter/feat/pencil/model/overview.dart';
import 'package:all_in_one_flutter/feat/pencil/model/solution.dart';
import 'package:all_in_one_flutter/feat/pencil/model/step_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  factory Question({
    String? code,
    String? title,
    @JsonKey(name: Keys.QUESTIONS_TYPE_QUESTION) String? typeQuestion,
    @JsonKey(name: Keys.QUESTIONS_CONTENT_QUESTION) String? contentQuestion,
    @JsonKey(name: Keys.QUESTIONS_URL_THUMBNAIL) String? urlThumbnail,
    @JsonKey(name: Keys.QUESTIONS_SOLVE_TIME) int? solveTime,
    @JsonKey(name: Keys.QUESTIONS_INCORRECT_RATE) int? incorrectRate,
    @JsonKey(name: Keys.QUESTIONS_ANSWERS_CORRECT)
    required List<String> answersCorrects,
    required List<Answer> answers,
    Overview? overview,
    List<StepView>? stepviews,
    List<Solution>? solutions,
    @JsonKey(includeFromJson: false) String? problemAnswer,
    @JsonKey(includeFromJson: false) String? problemDraw,
  }) = _Question;

  factory Question.initial() => Question(answersCorrects: [], answers: []);

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
