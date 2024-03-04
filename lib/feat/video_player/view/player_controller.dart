import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class PlayerController extends StatelessWidget {
  const PlayerController({
    super.key,
    required this.controller,
    required this.onTapPrevious,
    required this.onTapNext,
    required this.onPress,
  });

  final VideoPlayerController controller;
  final void Function() onTapPrevious;
  final void Function() onTapNext;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onTapPrevious,
          icon: Assets.icons.player.previous.svg(),
        ),
        SpaceH(size: 40.w),
        SizedBox(
          width: 60.w,
          child: IconButton(
            onPressed: () {
              if (controller.value.isPlaying) {
                controller.pause();
              } else {
                controller.play();
              }

              onPress();
            },
            icon: controller.value.isPlaying
                ? Assets.icons.player.pause.svg()
                : Assets.icons.player.play.svg(),
          ),
        ),
        SpaceH(size: 40.w),
        IconButton(
          onPressed: onTapNext,
          icon: Assets.icons.player.next.svg(),
        ),
      ],
    );
  }
}
