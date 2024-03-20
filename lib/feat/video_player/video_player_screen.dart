import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:all_in_one_flutter/feat/video_player/controller/app_video_player_controller.dart';
import 'package:all_in_one_flutter/feat/video_player/controller/video_player_state.dart';
import 'package:all_in_one_flutter/feat/video_player/view/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoPlayerScreen extends ConsumerStatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  ConsumerState<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends ConsumerState<VideoPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<VideoPlayerState> state =
        ref.watch(appVideoPlayerControllerProvider);

    return Scaffold(
      body: state.when(
        data: (state) {
          return VideoPlayer(
            contents: state.contents,
            onTapBookmark: (isBookmarked) {
              // API Call
            },
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(
                '${Strings.ERROR_STATE_INFO_IS_NULL}/n error: $error, stackTrace: $stackTrace'),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
