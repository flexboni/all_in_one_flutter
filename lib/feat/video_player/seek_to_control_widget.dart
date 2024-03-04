import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SeekToControlWidget extends StatelessWidget {
  /// Double tap 으로 앞이나 뒤로 player 이동하는 widget
  const SeekToControlWidget({
    super.key,
    required this.controller,
    required this.onShowController,
    required this.onTapFullScreen,
    required this.seekTime,
  });

  final VideoPlayerController controller;
  final void Function() onShowController;
  final void Function() onTapFullScreen;
  final int seekTime;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onDoubleTapDown: (TapDownDetails details) {
          final double width = context.size!.width;
          final double localWidth = details.localPosition.dx;
          final int nowPlayTime = controller.value.position.inMilliseconds;
          // seekTime 만큼 뒤로 가기
          if (localWidth < width * 2 / 5) {
            int reduceTime = nowPlayTime - seekTime;
            if (reduceTime < 0) {
              reduceTime = 0;
            }

            controller.seekTo(
              Duration(milliseconds: reduceTime),
            );
          } else if (localWidth > width * 3 / 5) {
            // seekTime 만큼 앞으로 가기
            int increaseTime = nowPlayTime + seekTime;
            final int endTime = controller.value.duration.inMilliseconds;
            if (increaseTime > endTime) {
              increaseTime = endTime - seekTime;
            }

            controller.seekTo(
              Duration(milliseconds: increaseTime),
            );
          }
        },
        onTap: onShowController,
        onVerticalDragUpdate: (details) {
          if (details.delta.dy < -10.0) {
            onTapFullScreen();
          }
        },
      ),
    );
  }
}
