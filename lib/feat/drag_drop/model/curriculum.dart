import 'package:freezed_annotation/freezed_annotation.dart';

part 'curriculum.freezed.dart';
part 'curriculum.g.dart';

@freezed
class Curriculum with _$Curriculum {
  const factory Curriculum({
    required String code,
    required String grade,
    required String title,
    required int count,
    required int day,
  }) = _Curriculum;

  factory Curriculum.initial() => const Curriculum(
        code: '',
        grade: '',
        title: '',
        count: 0,
        day: 0,
      );

  factory Curriculum.fromJson(Map<String, dynamic> json) =>
      _$CurriculumFromJson(json);
}
