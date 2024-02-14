import 'package:all_in_one_flutter/feat/video_player/full_screen_video_widget.dart';
import 'package:all_in_one_flutter/feat/video_player/normal_screen_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController controller;

  bool isFullScreen = false;

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isFullScreen
        ? FullScreenVideoWidget(
            controller: controller,
            onTapFullScreen: () {
              setState(() {
                isFullScreen = false;
              });
            })
        : NormalScreenVideoWidget(
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
          );
  }
}
