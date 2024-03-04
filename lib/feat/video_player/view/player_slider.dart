import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerSlider extends StatelessWidget {
  const PlayerSlider({
    super.key,
    required this.controller,
    required this.onChangEnd,
    required this.playTime,
    required this.endTime,
    required this.trackHeight,
    required this.thumbRadius,
    this.controllerTimer,
    this.activeTrackColor,
    this.thumbColor,
  });

  final VideoPlayerController controller;
  final void Function() onChangEnd;
  final Duration playTime;
  final Duration endTime;
  final double trackHeight;
  final double thumbRadius;
  final Timer? controllerTimer;
  final Color? activeTrackColor;
  final Color? thumbColor;

  @override
  Widget build(BuildContext context) {
    final double percent = playTime.inMilliseconds / endTime.inMilliseconds;
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: trackHeight,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: thumbRadius),
      ),
      child: Slider(
        onChanged: (double value) {
          if (controllerTimer != null) {
            controllerTimer!.cancel();
          }

          if (controller.value.isPlaying) {
            controller.pause();
          }

          controller.seekTo(
            Duration(
              milliseconds:
                  (value * controller.value.duration.inMilliseconds).toInt(),
            ),
          );
        },
        onChangeEnd: (double value) {
          controller.seekTo(
            Duration(
              milliseconds:
                  (value * controller.value.duration.inMilliseconds).toInt(),
            ),
          );

          if (!controller.value.isPlaying) {
            controller.play();
          }

          onChangEnd();
        },
        activeColor: activeTrackColor ?? Colors.grey[400],
        inactiveColor: activeTrackColor ?? Colors.grey[700],
        thumbColor: thumbColor,
        value: percent,
      ),
    );
  }
}
