import 'package:all_in_one_flutter/feat/pencil/model/question.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam.freezed.dart';
part 'exam.g.dart';

@freezed
class Exam with _$Exam {
  const factory Exam({
    required int total,
    required List<Question> questions,
  }) = _Exam;

  factory Exam.initial() => const Exam(total: 0, questions: []);

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);
}
