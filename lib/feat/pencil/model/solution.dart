import 'package:all_in_one_flutter/constant/keys.dart';
import 'package:all_in_one_flutter/feat/pencil/model/lecture.dart';
import 'package:all_in_one_flutter/feat/pencil/model/solution_step.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'solution.freezed.dart';
part 'solution.g.dart';

@freezed
class Solution with _$Solution {
  const factory Solution({
    String? comment,
    @JsonKey(name: Keys.SOLUTIONS_QUESTION_CODE) String? questionCode,
    String? code,
    List<Lecture>? lectures,
    List<SolutionStep>? steps,
  }) = _Solution;

  factory Solution.fromJson(Map<String, dynamic> json) =>
      _$SolutionFromJson(json);
}
