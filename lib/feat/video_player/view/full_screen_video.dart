import 'dart:async';

import 'package:all_in_one_flutter/feat/video_player/model/content.dart';
import 'package:all_in_one_flutter/feat/video_player/view/check_point.dart';
import 'package:all_in_one_flutter/feat/video_player/view/player_controller.dart';
import 'package:all_in_one_flutter/feat/video_player/view/player_slider.dart';
import 'package:all_in_one_flutter/feat/video_player/view/seek_to_control.dart';
import 'package:all_in_one_flutter/feat/video_player/view/speed_change_button.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideo extends StatefulWidget {
  const FullScreenVideo({
    super.key,
    required this.controller,
    required this.content,
    required this.onTapFullScreen,
    required this.onTapPrevious,
    required this.onTapNext,
    required this.onShowController,
    required this.onHideController,
    required this.onTapBookmark,
    required this.onTapCheckPoint,
    required this.onCloseCheckPoint,
    required this.seekTime,
    required this.showController,
    required this.isBookmarked,
    required this.showCheckPoint,
    this.trackHeight = 20.0,
    this.smallIconSize = 40.0,
    required this.controllerIconSize,
    required this.fullScreenIconSize,
    this.thumbRadius = 15.0,
    this.timeTextSize = 30.0,
    this.smallIconColor = Colors.white,
    this.controllerIconColor = Colors.white,
    this.inactiveTrackColor,
    this.activeTrackColor,
    this.thumbColor = Colors.white,
    required this.buttonColor,
  });

  final VideoPlayerController controller;
  final Content content;
  final void Function() onTapFullScreen;
  final void Function() onTapPrevious;
  final void Function() onTapNext;
  final void Function() onShowController;
  final void Function() onHideController;
  final void Function() onTapBookmark;
  final void Function() onTapCheckPoint;
  final void Function() onCloseCheckPoint;
  final int seekTime;
  final bool showController;
  final bool isBookmarked;
  final bool showCheckPoint;
  final double trackHeight;
  final double smallIconSize;
  final double controllerIconSize;
  final double thumbRadius;
  final double timeTextSize;
  final double fullScreenIconSize;
  final Color smallIconColor;
  final Color controllerIconColor;
  final Color? inactiveTrackColor;
  final Color? activeTrackColor;
  final Color thumbColor;
  final Color buttonColor;

  @override
  State<FullScreenVideo> createState() => _FullScreenVideoState();
}

class _FullScreenVideoState extends State<FullScreenVideo> {
  bool showRemainTime = false;

  Timer? controllerTimer;

  @override
  void dispose() {
    if (controllerTimer != null) {
      controllerTimer!.cancel();
    }
    super.dispose();
  }

  /// 참고 : https://www.kindacode.com/snippet/dart-flutter-convert-a-duration-to-hhmmss-format/
  String getMinuteSecondDurationTime(Duration duration) {
    final String minutes =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  String getTimeDiff({
    required Duration endDuration,
    required Duration startDuration,
  }) {
    final String diffMinutes = (endDuration.inMinutes.remainder(60) -
            startDuration.inMinutes.remainder(60))
        .toString()
        .padLeft(2, '0');
    final String diffSeconds = (endDuration.inSeconds.remainder(60) -
            startDuration.inSeconds.remainder(60))
        .toString()
        .padLeft(2, '0');

    return '-$diffMinutes:$diffSeconds';
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final Duration playTime = widget.controller.value.position;
    final String leftTime = getMinuteSecondDurationTime(playTime);
    final Duration endTime = widget.controller.value.duration;
    final String rightTime = showRemainTime
        ? getTimeDiff(endDuration: endTime, startDuration: playTime)
        : getMinuteSecondDurationTime(endTime);

    return Material(
      child: GestureDetector(
        onTap: widget.onShowController,
        onVerticalDragUpdate: (details) {
          if (details.delta.dy > 10.0) {
            widget.onTapFullScreen();
          }
        },
        child: SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            children: [
              VideoPlayer(widget.controller),
              SeekToControl(
                controller: widget.controller,
                onShowController: widget.onShowController,
                onTapFullScreen: widget.onTapFullScreen,
                seekTime: widget.seekTime,
              ),
              if (widget.showController)
                Stack(
                  children: [
                    InkWell(
                      onTap: widget.onHideController,
                      child: Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        color: Colors.black.withOpacity(0.4),
                        alignment: Alignment.center,
                        child: PlayerController(
                          controller: widget.controller,
                          content: widget.content,
                          onTapPrevious: widget.onTapPrevious,
                          onTapNext: widget.onTapNext,
                          onShowController: widget.onShowController,
                          onHideController: widget.onHideController,
                          onTapFullScreen: widget.onTapFullScreen,
                          onTapBookmark: widget.onTapBookmark,
                          onTapCheckPoint: widget.onTapCheckPoint,
                          buttonColor: widget.buttonColor,
                          fullScreenIconSize: widget.fullScreenIconSize,
                          controllerIconSize: widget.controllerIconSize,
                          isBookmarked: widget.isBookmarked,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      child: SizedBox(
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                child: PlayerSlider(
                                  controller: widget.controller,
                                  onChangEnd: widget.onShowController,
                                  playTime: playTime,
                                  endTime: endTime,
                                  trackHeight: widget.trackHeight,
                                  thumbRadius: widget.thumbRadius,
                                  activeTrackColor: widget.activeTrackColor,
                                  thumbColor: widget.thumbColor,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  // TODO
                                  // playTime.,
                                  '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: widget.timeTextSize,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SpeedChangeButton(
                                  controller: widget.controller,
                                  onShowController: widget.onShowController,
                                ),
                                IconButton(
                                  onPressed: widget.onTapFullScreen,
                                  icon: Icon(
                                    Icons.zoom_in_map_rounded,
                                    color: Colors.white,
                                    size: widget.smallIconSize,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              if (widget.showCheckPoint)
                CheckPoint(onCloseCheckPoint: widget.onCloseCheckPoint),
            ],
          ),
        ),
      ),
    );
  }

  Widget time(String text) => Container(
        width: MediaQuery.of(context).size.width * 0.08,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: widget.timeTextSize,
          ),
        ),
      );

  Widget slider({
    required Duration endTime,
    required Duration playTime,
  }) {
    final double percent = playTime.inMilliseconds / endTime.inMilliseconds;
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: widget.trackHeight,
        thumbShape:
            RoundSliderThumbShape(enabledThumbRadius: widget.thumbRadius),
      ),
      child: Slider(
        onChanged: (double value) {
          if (controllerTimer != null) {
            controllerTimer!.cancel();
          }

          if (widget.controller.value.isPlaying) {
            widget.controller.pause();
          }

          widget.controller.seekTo(
            Duration(
              milliseconds:
                  (value * widget.controller.value.duration.inMilliseconds)
                      .toInt(),
            ),
          );
        },
        onChangeEnd: (double value) {
          widget.controller.seekTo(
            Duration(
              milliseconds:
                  (value * widget.controller.value.duration.inMilliseconds)
                      .toInt(),
            ),
          );

          if (!widget.controller.value.isPlaying) {
            widget.controller.play();
          }

          widget.onShowController();
        },
        activeColor: widget.activeTrackColor ?? Colors.grey[400],
        inactiveColor: widget.activeTrackColor ?? Colors.grey[700],
        thumbColor: widget.thumbColor,
        value: percent,
      ),
    );
  }
}
