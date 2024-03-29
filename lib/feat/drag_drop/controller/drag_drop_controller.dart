import 'package:all_in_one_flutter/core/utils/file_utils.dart';
import 'package:all_in_one_flutter/feat/drag_drop/controller/drag_drop_state.dart';
import 'package:all_in_one_flutter/feat/drag_drop/model/curriculum_data.dart';
import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drag_drop_controller.g.dart';

@riverpod
class DragDropController extends _$DragDropController {
  Future<List<CurriculumData>> _getSubjectList() async {
    final Map<String, dynamic> a =
        await FileUtils.readJsonFile(Assets.json.subjects);
    return (a['data'] as List<dynamic>)
        .map((e) => CurriculumData.fromJson(e))
        .toList();
  }

  Future<List<CurriculumData>> _getTodayLearnList() async {
    final Map<String, dynamic> a =
        await FileUtils.readJsonFile(Assets.json.todayLearns);
    return (a['data'] as List<dynamic>)
        .map((e) => CurriculumData.fromJson(e))
        .toList();
  }

  @override
  FutureOr<DragDropState> build() async {
    final List<CurriculumData> subjectList = await _getSubjectList();
    final List<CurriculumData> todayLearnList = await _getTodayLearnList();

    return DragDropState.initial().copyWith(
      subjectList: subjectList,
      todyLearnList: todayLearnList,
    );
  }
}
