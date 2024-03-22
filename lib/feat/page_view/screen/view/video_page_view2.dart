import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPageView2 extends StatefulWidget {
  const VideoPageView2({super.key});

  @override
  State<VideoPageView2> createState() => _VideoPageView2State();
}

class _VideoPageView2State extends State<VideoPageView2> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://d3c4mbu4lgmuea.cloudfront.net/lecture/video/1706098190359_bikss6jih.mp4',
      ),
    )
      ..initialize()
      ..play();
  }

  @override
  void dispose() {
    _controller
      ..pause()
      ..dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(_controller),
      ),
    );
  }
}
