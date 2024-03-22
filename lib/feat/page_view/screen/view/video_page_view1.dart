import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPageView1 extends StatefulWidget {
  const VideoPageView1({super.key});

  @override
  State<VideoPageView1> createState() => _VideoPageView1State();
}

class _VideoPageView1State extends State<VideoPageView1> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://d3c4mbu4lgmuea.cloudfront.net/lecture/video/1706078097437_0szotblpt.mp4',
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
