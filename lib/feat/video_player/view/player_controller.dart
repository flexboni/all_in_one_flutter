import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:all_in_one_flutter/core/utils/utils.dart';
import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:all_in_one_flutter/feat/video_player/model/content.dart';
import 'package:all_in_one_flutter/feat/video_player/view/play_repeat_button.dart';
import 'package:all_in_one_flutter/feat/video_player/view/speed_change_button.dart';
import 'package:all_in_one_flutter/feat/video_player/view/type_indicator.dart';
import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class PlayerController extends ConsumerWidget {
  const PlayerController({
    super.key,
    required this.controller,
    required this.contents,
    required this.currentIndex,
    required this.onTapPrevious,
    required this.onTapNext,
    required this.onShowController,
    required this.onHideController,
    required this.onTapBookmark,
    required this.onTapCheckPoint,
    required this.onTapFullScreen,
    this.onTapRepeat,
    required this.onTapPlaylist,
    required this.isBookmarked,
    required this.isFullScreen,
    required this.isMultiplePlaylist,
    required this.repeatMode,
  });

  final VideoPlayerController controller;
  final List<Content> contents;
  final int currentIndex;
  final void Function() onTapPrevious;
  final void Function() onTapNext;
  final void Function() onShowController;
  final void Function() onHideController;
  final void Function() onTapBookmark;
  final void Function() onTapCheckPoint;
  final void Function() onTapFullScreen;
  final void Function(RepeatMode mode)? onTapRepeat;
  final void Function() onTapPlaylist;
  final bool isBookmarked;
  final bool isFullScreen;
  final bool isMultiplePlaylist;
  final RepeatMode repeatMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Content content = contents[currentIndex];
    final bool isFirst = currentIndex == 0;
    final bool isLast = currentIndex == contents.length - 1;

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
                _buildTopInformation(content),
                Column(children: [_buildSlider(), _buildBottomButtons()]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isMultiplePlaylist)
                  IconButton(
                    onPressed: isFirst ? null : onTapPrevious,
                    icon: Assets.icons.player.previousVideo.svg(
                      colorFilter: ColorFilter.mode(
                        isFirst ? Colors.grey : Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
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
                if (isMultiplePlaylist)
                  IconButton(
                    onPressed: isLast ? null : onTapNext,
                    icon: Assets.icons.player.nextVideo.svg(
                      colorFilter: ColorFilter.mode(
                        isLast ? Colors.grey : Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTopInformation(Content content) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 17.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TypeIndicator(type: content.lectureType),
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
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                ),
              ],
            ),
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
            child: SliderTheme(
              data: const SliderThemeData(
                trackHeight: 2,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
              ),
              child: Slider(
                value: playDuration.inSeconds.toDouble(),
                max: totalDuration.inSeconds.toDouble(),
                onChanged: (double value) {
                  onShowController();

                  controller.seekTo(Duration(seconds: value.toInt()));
                },
                activeColor: Colors.green,
                inactiveColor: Colors.grey,
              ),
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
                  textStyle: TextStyle(fontSize: 14.sp),
                ),
              ),
              TextButton.icon(
                onPressed: onTapCheckPoint,
                icon: Assets.icons.player.checkPoint.svg(),
                label: const Text(Strings.CHECK_POINT),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 14.sp),
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
              PlayRepeatButton(
                controller: controller,
                repeatMode: repeatMode,
                isMultiplePlaylist: isMultiplePlaylist,
                onTapRepeat: onTapRepeat,
              ),
              IconButton(
                onPressed: onTapFullScreen,
                icon: isFullScreen
                    ? Assets.icons.player.fullScreenActive.svg()
                    : Assets.icons.player.fullScreenDefault.svg(),
              ),
              if (contents.length > 1)
                IconButton(
                  onPressed: onTapPlaylist,
                  icon: Assets.icons.player.playlist.svg(),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
