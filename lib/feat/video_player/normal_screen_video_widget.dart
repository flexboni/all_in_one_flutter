import 'package:all_in_one_flutter/feat/parents.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class NormalScreenVideoWidget extends StatelessWidget {
  const NormalScreenVideoWidget({
    super.key,
    required this.controller,
    required this.onTapFullScreen,
  });

  final VideoPlayerController controller;
  final void Function() onTapFullScreen;

  @override
  Widget build(BuildContext context) {
    return Parents(
      title: 'Video player',
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: VideoPlayer(controller),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('title'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.seekTo(
                          Duration(
                            seconds: controller.value.position.inSeconds - 10,
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    IconButton(
                      onPressed: () {
                        if (controller.value.isPlaying) {
                          controller.pause();
                        } else {
                          controller.play();
                        }
                      },
                      icon: Icon(controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.seekTo(
                          Duration(
                            seconds: controller.value.position.inSeconds + 10,
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: onTapFullScreen,
                  icon: const Icon(Icons.fullscreen),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
