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
    required this.onTapBookmark,
    required this.onTapCheckPoint,
    required this.onTapFullScreen,
    required this.onTapRepeat,
    required this.buttonColor,
    required this.fullScreenIconSize,
    required this.controllerIconSize,
    required this.isBookmarked,
    required this.isFullScreen,
  });

  final VideoPlayerController controller;
  final Content content;
  final void Function() onTapPrevious;
  final void Function() onTapNext;
  final void Function() onShowController;
  final void Function() onHideController;
  final void Function() onTapBookmark;
  final void Function() onTapCheckPoint;
  final void Function() onTapFullScreen;
  final void Function() onTapRepeat;
  final Color buttonColor;
  final double fullScreenIconSize;
  final double controllerIconSize;
  final bool isBookmarked;
  final bool isFullScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onHideController,
      child: Container(
        color: Colors.black.withOpacity(0.4),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 17.w,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Type
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 5.w,
                          ),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                32.r,
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
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
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
                ),
                Column(
                  children: [
                    _buildSlider(),
                    _buildBottomButtons(),
                  ],
                ),
              ],
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

    return Padding(
      padding: EdgeInsets.only(left: 12.w, right: 24.w),
      child: Row(
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
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Padding(
      padding: EdgeInsets.fromLTRB(14.w, 0, 14.w, 8.w),
      child: Row(
        children: [
          Row(
            children: [
              TextButton.icon(
                onPressed: onTapBookmark,
                icon: isBookmarked
                    ? Assets.icons.player.bookmarkActive.svg()
                    : Assets.icons.player.bookmarkOutlined.svg(),
                label: const Text(Strings.BOOKMARK),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 20.sp),
                ),
              ),
              TextButton.icon(
                onPressed: onTapCheckPoint,
                icon: Assets.icons.player.checkPoint.svg(),
                label: const Text(Strings.CHECK_POINT),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 20.sp),
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
                onPressed: onTapRepeat,
                icon: Assets.icons.player.repeat.svg(
                  width: fullScreenIconSize,
                  colorFilter: ColorFilter.mode(buttonColor, BlendMode.srcIn),
                ),
              ),
              IconButton(
                onPressed: onTapFullScreen,
                icon: isFullScreen
                    ? Assets.icons.player.fullScreenActive.svg(
                        width: fullScreenIconSize,
                        colorFilter:
                            ColorFilter.mode(buttonColor, BlendMode.srcIn),
                      )
                    : Assets.icons.player.fullScreenDefault.svg(
                        width: fullScreenIconSize,
                        colorFilter:
                            ColorFilter.mode(buttonColor, BlendMode.srcIn),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
