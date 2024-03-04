import 'dart:async';

import 'package:all_in_one_flutter/feat/video_player/player_controllers.dart';
import 'package:all_in_one_flutter/feat/video_player/player_slider.dart';
import 'package:all_in_one_flutter/feat/video_player/seek_to_control_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoWidget extends StatefulWidget {
  const FullScreenVideoWidget({
    super.key,
    required this.controller,
    required this.onTapFullScreen,
    required this.onTapPrevious,
    required this.onTapNext,
    required this.onShowController,
    required this.onHideController,
    required this.seekTime,
    required this.showController,
    this.trackHeight = 20.0,
    this.smallIconSize = 40.0,
    this.controllerIconSize = 100.0,
    this.thumbRadius = 15.0,
    this.timeTextSize = 30.0,
    this.smallIconColor = Colors.white,
    this.controllerIconColor = Colors.white,
    this.inactiveTrackColor,
    this.activeTrackColor,
    this.thumbColor = Colors.white,
  });

  final VideoPlayerController controller;
  final void Function() onTapFullScreen;
  final void Function() onTapPrevious;
  final void Function() onTapNext;
  final void Function() onShowController;
  final void Function() onHideController;
  final int seekTime;
  final bool showController;
  final double trackHeight;
  final double smallIconSize;
  final double controllerIconSize;
  final double thumbRadius;
  final double timeTextSize;
  final Color smallIconColor;
  final Color controllerIconColor;
  final Color? inactiveTrackColor;
  final Color? activeTrackColor;
  final Color thumbColor;

  @override
  State<FullScreenVideoWidget> createState() => _FullScreenVideoWidgetState();
}

class _FullScreenVideoWidgetState extends State<FullScreenVideoWidget> {
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
              SeekToControlWidget(
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
                        child: PlayerControllers(
                          controller: widget.controller,
                          onTapPrevious: widget.onTapPrevious,
                          onTapNext: widget.onTapNext,
                          onPress: widget.onShowController,
                        ),
                      ),
                    ),
                    settingButton(),
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
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget settingButton() {
    const double borderRadius = 30.0;
    const Color backgroundColor = Colors.black;
    const EdgeInsets padding =
        EdgeInsets.symmetric(horizontal: 20, vertical: 30);

    Future<void> showSettingModal() async {
      if (controllerTimer != null) {
        controllerTimer!.cancel();
      }

      final bool? isDone = await showModalBottomSheet<bool?>(
        context: context,
        backgroundColor: backgroundColor,
        builder: (_) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: ListView(
              padding: padding,
              children: [
                ListTile(
                  onTap: () async {
                    context.pop(false);

                    final List<double> items = [
                      0.25,
                      0.5,
                      0.75,
                      1.0,
                      1.25,
                      1.5,
                      1.75,
                      2,
                    ];

                    await showModalBottomSheet(
                      context: context,
                      backgroundColor: backgroundColor,
                      builder: (_) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(borderRadius),
                          child: ListView.separated(
                            padding: padding,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final double item = items[index];
                              final bool isSelected =
                                  widget.controller.value.playbackSpeed == item;
                              return ListTile(
                                onTap: () {
                                  widget.controller.setPlaybackSpeed(item);
                                  context.pop();
                                },
                                selected: isSelected,
                                selectedColor: Colors.red,
                                title: Text(
                                  item.toString(),
                                  style: TextStyle(
                                    color: widget.smallIconColor,
                                    fontSize: widget.timeTextSize,
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 5),
                          ),
                        );
                      },
                    );

                    widget.onShowController();
                  },
                  leading: Icon(
                    Icons.speed,
                    color: widget.smallIconColor,
                    size: widget.smallIconSize,
                  ),
                  title: Text(
                    '재생 속도',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widget.timeTextSize,
                    ),
                  ),
                  trailing: Text(
                    widget.controller.value.playbackSpeed.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widget.timeTextSize,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );

      if (isDone != false) {
        widget.onShowController();
      }
    }

    return Positioned(
      top: 20,
      right: 20,
      child: IconButton(
        onPressed: showSettingModal,
        icon: Icon(
          Icons.settings_rounded,
          color: widget.smallIconColor,
          size: widget.smallIconSize,
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
