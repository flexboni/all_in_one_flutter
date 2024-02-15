import 'package:all_in_one_flutter/constant/keys.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.freezed.dart';
part 'answer.g.dart';

enum Correct { T, F }

@freezed
class Answer with _$Answer {
  const factory Answer({
    @JsonKey(name: Keys.ANSWER_ANSWER_NO) int? answerNo,
    @JsonKey(name: Keys.ANSWER_CONTENT_ANSWER) String? contentAnswer,
    @JsonKey(name: Keys.ANSWER_EDITOR_ANSWER) String? editorAnswer,
    @JsonKey(name: Keys.ANSWER_CORRECT_ANSWER) String? correctAnswer,
    @JsonKey(name: Keys.ANSWER_IS_CORRECT) Correct? isCorrect,
    String? code,
    @JsonKey(name: Keys.ANSWER_QUESTION_CODE) String? questionCode,
  }) = _Answer;

  factory Answer.initial() => const Answer(code: '', isCorrect: Correct.F);

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
