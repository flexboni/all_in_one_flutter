import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:all_in_one_flutter/feat/video_player/controller/app_video_player_controller.dart';
import 'package:all_in_one_flutter/feat/video_player/controller/video_player_state.dart';
import 'package:all_in_one_flutter/feat/video_player/model/content.dart';
import 'package:all_in_one_flutter/feat/video_player/view/normal_screen_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoPlayerScreen extends ConsumerStatefulWidget {
  const VideoPlayerScreen({
    super.key,
    this.seekTime = 10000,
    this.controllerIconSize = 100,
  });

  final int seekTime;
  final double controllerIconSize;

  @override
  ConsumerState<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends ConsumerState<VideoPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<VideoPlayerState> state =
        ref.watch(appVideoPlayerControllerProvider);

    return state.when(
      data: (state) {
        final List<Content> contents = state.contents;
        final int currentIndex = state.currentIndex;

        return NormalScreenVideo(
          contents: contents,
          onTapBookmark: (isBookmarked) {},
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(
              '${Strings.ERROR_STATE_INFO_IS_NULL}/n error: $error, stackTrace: $stackTrace'),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
