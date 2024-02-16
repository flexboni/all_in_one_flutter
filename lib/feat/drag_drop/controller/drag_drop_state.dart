import 'package:all_in_one_flutter/feat/drag_drop/model/curriculum_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drag_drop_state.freezed.dart';

@freezed
class DragDropState with _$DragDropState {
  const factory DragDropState({required List<CurriculumData> curriculumDatas}) =
      _DragDropState;

  factory DragDropState.initial() => const DragDropState(curriculumDatas: []);
}
