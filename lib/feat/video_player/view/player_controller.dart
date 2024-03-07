import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:all_in_one_flutter/core/utils/utils.dart';
import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:all_in_one_flutter/feat/video_player/model/content.dart';
import 'package:all_in_one_flutter/feat/video_player/view/speed_change_button.dart';
import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class PlayerController extends ConsumerWidget {
  const PlayerController({
    super.key,
    required this.controller,
    required this.content,
    required this.onTapPrevious,
    required this.onTapNext,
    required this.onShowController,
    required this.onHideController,
    required this.onTapFullScreen,
    required this.buttonColor,
    required this.fullScreenIconSize,
    required this.controllerIconSize,
  });

  final VideoPlayerController controller;
  final Content content;
  final void Function() onTapPrevious;
  final void Function() onTapNext;
  final void Function() onShowController;
  final void Function() onHideController;
  final void Function() onTapFullScreen;
  final Color buttonColor;
  final double fullScreenIconSize;
  final double controllerIconSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onHideController,
      child: Container(
        color: Colors.black.withOpacity(0.4),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 7.w,
                          ),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                2.r,
                              ),
                            ),
                            color:
                                content.lectureType == Keys.LECTURE_TYPE_CONCEPT
                                    ? Colors.green
                                    : Colors.orange,
                          ),
                          child: Text(
                            Content.lectureTypeToName(content.lectureType),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        SpaceH(size: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              content.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              content.structure,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      _buildSlider(),
                      _buildBottomButtons(),
                    ],
                  ),
                ],
              ),
            ),
            Row(
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

                      onShowController();
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
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSlider() {
    final Duration playDuration = controller.value.position;
    final Duration totalDuration = controller.value.duration;

    return Row(
      children: [
        Expanded(
          child: Slider(
            value: playDuration.inMilliseconds / totalDuration.inMilliseconds,
            onChanged: (double value) {},
            activeColor: Colors.green,
          ),
        ),
        Text(
          AppDateUtils.convertDurationToMMSS(playDuration),
          style: TextStyle(color: Colors.white, fontSize: 12.sp),
        ),
        Text(
          '/ ${AppDateUtils.convertDurationToMMSS(totalDuration)}',
          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
        ),
      ],
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [
        Row(
          children: [
            SpeedChangeButton(
              controller: controller,
              onShowController: onShowController,
            ),
            IconButton(
              onPressed: onTapFullScreen,
              icon: Icon(
                Icons.fullscreen,
                color: buttonColor,
                size: fullScreenIconSize,
              ),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            SpeedChangeButton(
              controller: controller,
              onShowController: onShowController,
            ),
            IconButton(
              onPressed: onTapFullScreen,
              icon: Icon(
                Icons.fullscreen,
                color: buttonColor,
                size: fullScreenIconSize,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
