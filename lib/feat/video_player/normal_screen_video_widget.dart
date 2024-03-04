import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:all_in_one_flutter/feat/video_player/player_controllers.dart';
import 'package:all_in_one_flutter/feat/video_player/seek_to_control_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class NormalScreenVideoWidget extends StatefulWidget {
  const NormalScreenVideoWidget({
    super.key,
    required this.controller,
    required this.onTapPrevious,
    required this.onTapNext,
    required this.onTapFullScreen,
    required this.onShowController,
    required this.onHideController,
    required this.seekTime,
    required this.showController,
    this.buttonColor = Colors.white,
    this.fullScreenIconSize = 40,
    this.controllerIconSize = 100,
  });

  final VideoPlayerController controller;
  final void Function() onTapPrevious;
  final void Function() onTapNext;
  final void Function() onTapFullScreen;
  final void Function() onShowController;
  final void Function() onHideController;
  final int seekTime;
  final bool showController;
  final Color buttonColor;
  final double fullScreenIconSize;
  final double controllerIconSize;

  @override
  State<NormalScreenVideoWidget> createState() =>
      _NormalScreenVideoWidgetState();
}

class _NormalScreenVideoWidgetState extends State<NormalScreenVideoWidget> {
  @override
  Widget build(BuildContext context) {
    return Parents(
      title: 'Video player',
      body: Align(
        alignment: Alignment.topCenter,
        child: widget.controller.value.isInitialized
            ? Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: VideoPlayer(widget.controller),
                      ),
                      SeekToControlWidget(
                        controller: widget.controller,
                        onShowController: widget.onShowController,
                        onTapFullScreen: widget.onTapFullScreen,
                        seekTime: widget.seekTime,
                      ),
                      if (widget.showController)
                        Positioned.fill(
                          child: GestureDetector(
                            onTap: widget.onHideController,
                            child: Container(
                              color: Colors.black.withOpacity(0.4),
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
                                  PlayerControllers(
                                    controller: widget.controller,
                                    onTapPrevious: widget.onTapPrevious,
                                    onTapNext: widget.onTapNext,
                                    onPress: widget.onShowController,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
