import 'dart:async';

import 'package:all_in_one_flutter/feat/video_player/view/full_screen_video.dart';
import 'package:all_in_one_flutter/feat/video_player/view/normal_screen_video.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key, this.seekTime = 10000});

  final int seekTime;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController controller;

  bool isFullScreen = false;
  bool showController = false;

  Timer? controllerTimer;

  void listener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
      ),
    )
      ..initialize().then((_) {
        listener();
      })
      ..play();

    controller.addListener(listener);
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    controller.dispose();

    if (controllerTimer != null) {
      controllerTimer!.cancel();
    }
    super.dispose();
  }

  void _onShowController() {
    showController = true;

    if (controllerTimer != null) {
      controllerTimer!.cancel();
      controllerTimer = null;
    }

    controllerTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        showController = false;
      });
    });

    setState(() {});
  }

  void _onHideController() {
    setState(() {
      showController = false;
      if (controllerTimer != null) {
        controllerTimer!.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isFullScreen
        ? FullScreenVideo(
            controller: controller,
            onTapPrevious: () {
              debugPrint('onTapPrevious');
            },
            onTapNext: () {
              debugPrint('onTapNext');
            },
            onTapFullScreen: () {
              setState(() {
                isFullScreen = false;
              });
            },
            onShowController: _onShowController,
            onHideController: _onHideController,
            seekTime: widget.seekTime,
            showController: showController,
          )
        : NormalScreenVideo(
            controller: controller,
            onTapPrevious: () {
              debugPrint('onTapPrevious');
            },
            onTapNext: () {
              debugPrint('onTapNext');
            },
            onTapFullScreen: () {
              setState(() {
                isFullScreen = true;
              });
            },
            onShowController: _onShowController,
            onHideController: _onHideController,
            seekTime: widget.seekTime,
            showController: showController,
          );
  }
}
