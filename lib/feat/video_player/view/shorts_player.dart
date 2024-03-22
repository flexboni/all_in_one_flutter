import 'dart:async';

import 'package:all_in_one_flutter/feat/video_player/model/content.dart';
import 'package:all_in_one_flutter/feat/video_player/view/play_repeat_button.dart';
import 'package:all_in_one_flutter/feat/video_player/view/player_controller.dart';
import 'package:all_in_one_flutter/feat/video_player/view/playlist.dart';
import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart' as vp;

class ShortsPlayer extends StatefulWidget {
  const ShortsPlayer({
    super.key,
    required this.contents,
    required this.currentIndex,
    required this.onControllerListener,
    required this.onTapBookmark,
    required this.onTapRepeat,
    required this.repeatMode,
  });

  final List<Content> contents;
  final int currentIndex;
  final void Function(bool isComplete) onControllerListener;
  final void Function(bool isBookmarked) onTapBookmark;
  final void Function(RepeatMode mode) onTapRepeat;
  final RepeatMode repeatMode;

  @override
  State<ShortsPlayer> createState() => _ShortsPlayerState();
}

class _ShortsPlayerState extends State<ShortsPlayer> {
  late vp.VideoPlayerController controller;

  late Content content;

  bool isBookmarked = false;
  bool showPlaylist = false;

  Future<void> _initialVideoPlayerController() async {
    controller
      ..pause()
      ..removeListener(() => widget.onControllerListener);

    // controller =
    //     vp.VideoPlayerController.networkUrl(Uri.parse(widget.content.urlVideo))
    //       ..initialize()
    //       ..play()
    //       ..addListener(
    //         () => widget.onControllerListener(controller.value.isCompleted),
    //       );
  }

  @override
  void initState() {
    super.initState();

    content = widget.contents[widget.currentIndex];

    _initialVideoPlayerController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _hideStatusBar();
    });
  }

  void _showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  void _hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  void dispose() {
    controller
      ..pause()
      ..removeListener(() => widget.onControllerListener)
      ..dispose();

    _showStatusBar();

    super.dispose();
  }

  void _onTapBookmark() {
    isBookmarked = !isBookmarked;

    widget.onTapBookmark(isBookmarked);
  }

  void _onTapPlayList() {
    showPlaylist = true;
  }

  void _onTapClosePlaylist() {
    setState(() {
      showPlaylist = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: vp.VideoPlayer(controller),
          ),
        ),
        Positioned(
          top: 18.w,
          right: 18.w,
          child: IconButton(
            onPressed: () => context.pop(),
            icon: Assets.icons.player.close.svg(),
          ),
        ),
        if (showPlaylist)
          Playlist(
            onClose: _onTapClosePlaylist,
            currentIndex: widget.currentIndex,
            contents: widget.contents,
          ),
      ],
    );
  }

  Widget _buildPlayer() {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: vp.VideoPlayer(controller),
            ),
          ),
          // Positioned.fill(
          //   child: PlayerController(
          //     controller: controller,
          //     contents: widget.contents,
          //     currentIndex: currentIndex,
          //     onTapPrevious: _onTapPrevious,
          //     onTapNext: _onTapNext,
          //     onTapBookmark: _onTapBookmark,
          //     onTapRepeat: widget.onTapRepeat,
          //     onTapPlaylist: _onTapPlayList,
          //     isBookmarked: isBookmarked,
          //     isFullScreen: true,
          //     isMultiplePlaylist: widget.contents.length > 1,
          //     repeatMode: widget.repeatMode,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildPageChangeButtons() {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Assets.icons.player.previousPage.svg(),
          ),
        ],
      ),
    );
  }
}
