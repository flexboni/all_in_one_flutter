import 'package:all_in_one_flutter/core/utils/toast_utils.dart';
import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:all_in_one_flutter/feat/video_player/controller/app_video_player_controller.dart';
import 'package:all_in_one_flutter/feat/video_player/model/content.dart';
import 'package:all_in_one_flutter/feat/video_player/view/play_repeat_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShortsPlayerScreen extends ConsumerStatefulWidget {
  const ShortsPlayerScreen({super.key});

  @override
  ConsumerState<ShortsPlayerScreen> createState() => _ShortsPlayerScreenState();
}

class _ShortsPlayerScreenState extends ConsumerState<ShortsPlayerScreen> {
  int currentIndex = 0;
  RepeatMode repeatMode = RepeatMode.none;

  @override
  void initState() {
    super.initState();

    ref.listenManual(
      appVideoPlayerControllerProvider,
      (previous, next) {
        if (previous != next && next.hasError) {
          ToastUtils.error(next.error.toString());
        }
      },
    );
  }

  void _onTap() {
    final List<Content>? contents =
        ref.read(appVideoPlayerControllerProvider).value?.contents;
    if (contents == null || contents.isEmpty) {
      return;
    }

    // showDialog(
    //   context: context,
    //   builder: (_) {
    //     return ShortsPlayer(
    //       contents: contents,
    //       currentIndex: currentIndex,
    //       onTapBookmark: (bool isBookmarked) {},
    //       onTapRepeat: (RepeatMode mode) {},
    //       repeatMode: repeatMode,
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Parents(
      title: 'Popup video player',
      body: Center(
        child: ElevatedButton(
          onPressed: _onTap,
          child: const Text('PRESS'),
        ),
      ),
    );
  }
}
