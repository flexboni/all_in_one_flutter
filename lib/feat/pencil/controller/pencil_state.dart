import 'package:all_in_one_flutter/feat/pencil/model/exam.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pencil_state.freezed.dart';

@freezed
class PencilState with _$PencilState {
  const factory PencilState({required Exam exam, required int currentIndex}) =
      _PencilState;

  factory PencilState.initial() => PencilState(
        exam: Exam.initial(),
        currentIndex: 0,
      );
}
