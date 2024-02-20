import 'package:freezed_annotation/freezed_annotation.dart';

part 'curriculum.freezed.dart';
part 'curriculum.g.dart';

enum CurriculumType { none, lecture, problem }

@freezed
class Curriculum with _$Curriculum {
  const factory Curriculum({
    required String code,
    required CurriculumType type,
    String? grade,
    required String title,
    required int count,
    int? day,
  }) = _Curriculum;

  factory Curriculum.initial() => const Curriculum(
        code: '',
        type: CurriculumType.none,
        grade: '',
        title: '',
        count: 0,
      );

  factory Curriculum.fromJson(Map<String, dynamic> json) =>
      _$CurriculumFromJson(json);
}
