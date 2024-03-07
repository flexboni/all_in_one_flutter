import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:all_in_one_flutter/core/utils/toast_utils.dart';
import 'package:all_in_one_flutter/core/utils/utils.dart';
import 'package:all_in_one_flutter/feat/video_player/controller/video_player_state.dart';
import 'package:all_in_one_flutter/feat/video_player/model/content.dart';
import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_video_player_controller.g.dart';

@riverpod
class AppVideoPlayerController extends _$AppVideoPlayerController {
  Future<List<Content>> _getTodayLecture() async {
    return Future.delayed(
      const Duration(seconds: 1),
      () async {
        final response = await FileUtils.readJsonFile(Assets.json.todayLecture);
        return (response['contents'] as List)
            .map((e) => Content.fromJson(e))
            .toList();
      },
    );
  }

  @override
  FutureOr<VideoPlayerState> build() async {
    final contents = await _getTodayLecture();

    return VideoPlayerState.initial().copyWith(contents: contents);
  }

  Future<void> onTapPrevious() async {
    if (!state.hasValue) {
      ToastUtils.error(Strings.ERROR_STATE_INFO_IS_NULL);
      return;
    }

    final VideoPlayerState previousState = state.value!;
    final newIndex = previousState.currentIndex - 1;

    assert(newIndex >= 0, 'index must large than zero');

    state = AsyncData(previousState.copyWith(currentIndex: newIndex));
  }

  Future<void> onTapNext() async {
    if (!state.hasValue) {
      ToastUtils.error(Strings.ERROR_STATE_INFO_IS_NULL);
      return;
    }

    final VideoPlayerState previousState = state.value!;
    final newIndex = previousState.currentIndex + 1;

    assert(newIndex < previousState.contents.length,
        'index must smaller than contents length');

    state = AsyncData(previousState.copyWith(currentIndex: newIndex));
  }
}
