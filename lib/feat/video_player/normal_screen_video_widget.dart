import 'dart:async';

import 'package:all_in_one_flutter/core/widgets/parents.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class NormalScreenVideoWidget extends StatefulWidget {
  const NormalScreenVideoWidget({
    super.key,
    required this.controller,
    required this.onTapPrevious,
    required this.onTapNext,
    required this.onTapFullScreen,
    this.buttonColor = Colors.white,
    this.fullScreenIconSize = 40,
    this.controllerIconSize = 100,
  });

  final VideoPlayerController controller;
  final void Function() onTapPrevious;
  final void Function() onTapNext;
  final void Function() onTapFullScreen;
  final Color buttonColor;
  final double fullScreenIconSize;
  final double controllerIconSize;

  @override
  State<NormalScreenVideoWidget> createState() =>
      _NormalScreenVideoWidgetState();
}

class _NormalScreenVideoWidgetState extends State<NormalScreenVideoWidget> {
  bool showController = false;
  Timer? controllerTimer;

  @override
  void dispose() {
    if (controllerTimer != null) {
      controllerTimer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Parents(
      title: 'Video player',
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
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
                      if (controllerTimer != null) {
                        controllerTimer!.cancel();
                      }
                    }

                    setState(() {});
                  },
                  onVerticalDragUpdate: (details) {
                    if (details.delta.dy < -10.0) {
                      widget.onTapFullScreen();
                    }
                  },
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: VideoPlayer(widget.controller),
                  ),
                ),
                if (showController)
                  Positioned.fill(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          right: 10,
                          bottom: 10,
                          child: IconButton(
                            onPressed: widget.onTapFullScreen,
                            icon: Icon(
                              Icons.fullscreen,
                              color: widget.buttonColor,
                              size: widget.fullScreenIconSize,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: widget.onTapPrevious,
                              icon: Icon(
                                Icons.skip_previous_rounded,
                                color: widget.buttonColor,
                                size: widget.controllerIconSize,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if (widget.controller.value.isPlaying) {
                                  widget.controller.pause();
                                } else {
                                  widget.controller.play();
                                }
                              },
                              icon: Icon(
                                widget.controller.value.isPlaying
                                    ? Icons.pause_rounded
                                    : Icons.play_arrow_rounded,
                                color: widget.buttonColor,
                                size: widget.controllerIconSize,
                              ),
                            ),
                            IconButton(
                              onPressed: widget.onTapNext,
                              icon: Icon(
                                Icons.skip_next_rounded,
                                color: widget.buttonColor,
                                size: widget.controllerIconSize,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
