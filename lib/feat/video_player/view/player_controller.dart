import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:all_in_one_flutter/feat/video_player/model/content.dart';
import 'package:all_in_one_flutter/feat/video_player/view/play_repeat_button.dart';
import 'package:all_in_one_flutter/feat/video_player/view/player_controller_bottom_buttons.dart';
import 'package:all_in_one_flutter/feat/video_player/view/player_information.dart';
import 'package:all_in_one_flutter/feat/video_player/view/player_slider.dart';
import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
    required this.isPopup,
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
  final bool isPopup;
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
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: PlayerInformation(
                          type: content.lectureType,
                          title: content.title,
                          subTitle: content.structure,
                        ),
                      ),
                      if (isPopup)
                        IconButton(
                          onPressed: () => context.pop(),
                          icon: Assets.icons.player.close.svg(),
                        ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    PlayerSlider(
                      controller: controller,
                      onShowController: onShowController,
                    ),
                    PlayerControllerBottomButtons(
                      controller: controller,
                      onTapBookmark: onTapBookmark,
                      onTapCheckPoint: onTapCheckPoint,
                      onShowController: onShowController,
                      onTapRepeat: onTapRepeat,
                      onTapFullScreen: onTapFullScreen,
                      onTapPlaylist: onTapPlaylist,
                      isBookmarked: isBookmarked,
                      isMultiplePlaylist: isMultiplePlaylist,
                      isFullScreen: isFullScreen,
                      isPopup: isPopup,
                      repeatMode: repeatMode,
                    )
                  ],
                ),
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
}
