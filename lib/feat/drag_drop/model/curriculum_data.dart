import 'package:all_in_one_flutter/feat/drag_drop/model/curriculum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'curriculum_data.freezed.dart';
part 'curriculum_data.g.dart';

@freezed
class CurriculumData with _$CurriculumData {
  const factory CurriculumData({
    required int day,
    required List<Curriculum> items,
  }) = _CurriculumData;

  factory CurriculumData.fromJson(Map<String, dynamic> json) =>
      _$CurriculumDataFromJson(json);
}
