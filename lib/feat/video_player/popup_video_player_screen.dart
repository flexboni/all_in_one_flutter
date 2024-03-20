import 'package:all_in_one_flutter/core/utils/toast_utils.dart';
import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:all_in_one_flutter/feat/video_player/controller/app_video_player_controller.dart';
import 'package:all_in_one_flutter/feat/video_player/model/content.dart';
import 'package:all_in_one_flutter/feat/video_player/view/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopupVideoPlayerScreen extends ConsumerStatefulWidget {
  const PopupVideoPlayerScreen({super.key});

  @override
  ConsumerState<PopupVideoPlayerScreen> createState() =>
      _PopupVideoPlayerScreenState();
}

class _PopupVideoPlayerScreenState
    extends ConsumerState<PopupVideoPlayerScreen> {
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

    showDialog(
      context: context,
      builder: (_) {
        return VideoPlayer(
          contents: contents,
          onTapBookmark: (isBookmarked) {},
          isPopup: true,
        );
      },
    );
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
