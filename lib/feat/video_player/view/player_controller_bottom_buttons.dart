import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:all_in_one_flutter/feat/video_player/view/play_repeat_button.dart';
import 'package:all_in_one_flutter/feat/video_player/view/speed_change_button.dart';
import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class PlayerControllerBottomButtons extends StatelessWidget {
  const PlayerControllerBottomButtons({
    super.key,
    required this.controller,
    required this.onTapBookmark,
    required this.onTapCheckPoint,
    required this.onShowController,
    required this.onTapRepeat,
    required this.onTapFullScreen,
    required this.onTapPlaylist,
    required this.isBookmarked,
    required this.isMultiplePlaylist,
    required this.isFullScreen,
    required this.isPopup,
    required this.repeatMode,
  });

  final VideoPlayerController controller;
  final void Function() onTapBookmark;
  final void Function() onTapCheckPoint;
  final void Function() onShowController;
  final void Function(RepeatMode mode)? onTapRepeat;
  final void Function() onTapFullScreen;
  final void Function() onTapPlaylist;
  final bool isBookmarked;
  final bool isMultiplePlaylist;
  final bool isFullScreen;
  final bool isPopup;
  final RepeatMode repeatMode;

  @override
  Widget build(BuildContext context) {
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
              if (!isPopup)
                IconButton(
                  onPressed: onTapFullScreen,
                  icon: isFullScreen
                      ? Assets.icons.player.fullScreenActive.svg()
                      : Assets.icons.player.fullScreenDefault.svg(),
                ),
              if (isMultiplePlaylist)
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
