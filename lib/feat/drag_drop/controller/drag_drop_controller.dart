import 'package:all_in_one_flutter/core/utils/file_utils.dart';
import 'package:all_in_one_flutter/feat/drag_drop/controller/drag_drop_state.dart';
import 'package:all_in_one_flutter/feat/drag_drop/model/curriculum_data.dart';
import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drag_drop_controller.g.dart';

@riverpod
class DragDropController extends _$DragDropController {
  Future<List<CurriculumData>> _getCurriculum() async {
    final Map<String, dynamic> a =
        await FileUtils.readJsonFile(Assets.json.curriculum);
    return (a['data'] as List<dynamic>)
        .map((e) => CurriculumData.fromJson(e))
        .toList();
  }

  @override
  FutureOr<DragDropState> build() async {
    final List<CurriculumData> curriculumDatas = await _getCurriculum();

    return DragDropState.initial().copyWith(curriculumDatas: curriculumDatas);
  }
}
