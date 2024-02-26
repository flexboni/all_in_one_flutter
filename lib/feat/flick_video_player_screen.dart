import 'package:flutter/material.dart';

class FlickVideoPlayerScreen extends StatefulWidget {
  const FlickVideoPlayerScreen({super.key});

  @override
  State<FlickVideoPlayerScreen> createState() => _FlickVideoPlayerScreenState();
}

class _FlickVideoPlayerScreenState extends State<FlickVideoPlayerScreen> {
  // late FlickManager flickManager;

  // @override
  // void initState() {
  //   super.initState();

  //   flickManager = FlickManager(
  //     videoPlayerController: VideoPlayerController.networkUrl(
  //       Uri.parse(
  //           'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4'),
  //     ),
  //   );
  // }

  // @override
  // void dispose() {
  //   flickManager.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flick video player'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            // SizedBox(
            //   width: size.width * 0.5,
            //   child: FlickVideoPlayer(flickManager: flickManager),
            // ),
            // const SizedBox(height: 50),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     IconButton(
            //       onPressed: () {
            //         flickManager.flickControlManager?.play();
            //       },
            //       icon: const Icon(Icons.play_arrow),
            //     ),
            //     IconButton(
            //       onPressed: () {
            //         flickManager.flickControlManager?.pause();
            //       },
            //       icon: const Icon(Icons.pause),
            //     ),
            //     IconButton(
            //       onPressed: () {
            //         flickManager.flickDisplayManager!.hidePlayerControls();
            //       },
            //       icon: const Icon(Icons.hide_image),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
