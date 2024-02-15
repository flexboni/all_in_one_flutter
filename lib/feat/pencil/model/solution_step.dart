import 'package:all_in_one_flutter/constant/keys.dart';
import 'package:all_in_one_flutter/feat/pencil/model/lecture.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'solution_step.freezed.dart';
part 'solution_step.g.dart';

@freezed
class SolutionStep with _$SolutionStep {
  const factory SolutionStep({
    String? code,
    int? step,
    String? comment,
    @JsonKey(name: Keys.SOLUTION_STEPS_CONTENT_SOLUTION)
    String? contentSolution,
    @JsonKey(name: Keys.SOLUTION_STEPS_EDITOR_SOLUTION) String? editorSolution,
    @JsonKey(name: Keys.SOLUTION_STEPS_LATEX_SOLUTION) String? latexSolution,
    List<Lecture>? lectures,
  }) = _SolutionStep;

  factory SolutionStep.fromJson(Map<String, dynamic> json) =>
      _$SolutionStepFromJson(json);
}
