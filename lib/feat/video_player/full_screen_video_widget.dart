import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoWidget extends StatefulWidget {
  const FullScreenVideoWidget({
    super.key,
    required this.controller,
    required this.onTapFullScreen,
  });

  final VideoPlayerController controller;
  final void Function() onTapFullScreen;

  @override
  State<FullScreenVideoWidget> createState() => _FullScreenVideoWidgetState();
}

class _FullScreenVideoWidgetState extends State<FullScreenVideoWidget> {
  bool showRemainTime = false;
  bool showController = false;

  late Timer controllerTimer;

  void init() async {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    controllerTimer.cancel();
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
        onTap: () {
          if (!showController) {
            showController = true;

            controllerTimer = Timer(const Duration(seconds: 3), () {
              setState(() {
                showController = false;
              });
            });
          } else {
            showController = false;
            controllerTimer.cancel();
          }

          setState(() {});
        },
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
              if (showController)
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: playButton(size: 100),
                    ),
                    Positioned(
                      bottom: 20,
                      child: SizedBox(
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            playButton(),
                            time(leftTime),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                child: progressBar(
                                    endTime: endTime, playTime: playTime),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  showRemainTime = !showRemainTime;
                                });
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: time(rightTime),
                            ),
                            IconButton(
                              onPressed: widget.onTapFullScreen,
                              icon: const Icon(
                                Icons.zoom_in_map_rounded,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }

  IconButton playButton({Color color = Colors.white, double size = 40}) =>
      IconButton(
        onPressed: () {
          widget.controller.value.isPlaying
              ? widget.controller.pause()
              : widget.controller.play();

          setState(() {});
        },
        icon: Icon(
          widget.controller.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow_rounded,
          color: color,
          size: size,
        ),
      );

  Widget time(String text) => Container(
        width: MediaQuery.of(context).size.width * 0.08,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
      );

  LayoutBuilder progressBar(
      {required Duration endTime, required Duration playTime}) {
    const double height = 15;
    const double radius = 15;

    return LayoutBuilder(builder: (_, boxConstraints) {
      final double percent = playTime.inMilliseconds /
          endTime.inMilliseconds *
          boxConstraints.maxWidth;
      return Stack(
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: percent,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ],
      );
    });
  }
}
