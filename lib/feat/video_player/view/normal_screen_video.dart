import 'dart:async';

import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:all_in_one_flutter/feat/video_player/model/content.dart';
import 'package:all_in_one_flutter/feat/video_player/view/check_point.dart';
import 'package:all_in_one_flutter/feat/video_player/view/play_repeat_button.dart';
import 'package:all_in_one_flutter/feat/video_player/view/player_bottom_buttons.dart';
import 'package:all_in_one_flutter/feat/video_player/view/player_controller.dart';
import 'package:all_in_one_flutter/feat/video_player/view/seek_to_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

enum PlayerStatus { none, initialized, buffering, playing, completed }

class NormalScreenVideo extends StatefulWidget {
  const NormalScreenVideo({
    super.key,
    required this.contents,
    required this.onTapBookmark,
    this.showBottomButtons = true,
  });

  final List<Content> contents;
  final void Function(bool isBookmarked) onTapBookmark;
  final bool showBottomButtons;

  @override
  State<NormalScreenVideo> createState() => _NormalScreenVideoState();
}

class _NormalScreenVideoState extends State<NormalScreenVideo> {
  bool isFullScreen = false;
  VideoPlayerController? controller;

  bool showPlayerController = false;
  bool isBookmarked = false;
  bool showCheckPoint = false;

  Timer? controllerTimer;

  int currentIndex = 0;

  RepeatMode repeatMode = RepeatMode.none;

  final int seekTime = 10000;

  void listener() {
    setState(() {
      if (controller!.value.isCompleted) {
        if (repeatMode == RepeatMode.all) {
          if (currentIndex == widget.contents.length - 1) {
            currentIndex = 0;
          } else {
            ++currentIndex;
          }

          _initialVideoPlayerController(widget.contents[currentIndex]);
        }
      }
    });
  }

  Future<void> _initialVideoPlayerController(Content content) async {
    if (controller != null) {
      controller!
        ..pause()
        ..removeListener(listener);
    }

    controller = VideoPlayerController.networkUrl(Uri.parse(content.urlVideo));
    await controller!.initialize();
    controller!
      ..play()
      ..addListener(listener);
  }

  @override
  void initState() {
    super.initState();

    if (widget.contents.isNotEmpty) {
      _initialVideoPlayerController(widget.contents.first);
    }
  }

  void _showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  void _initControllerTimer() {
    controllerTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        showPlayerController = false;
      });
    });
  }

  void _onCancelControllerTimer() {
    if (controllerTimer != null) {
      controllerTimer!.cancel();
      controllerTimer = null;
    }
  }

  @override
  void dispose() {
    if (controller != null) {
      controller!
        ..pause()
        ..removeListener(listener)
        ..dispose();
    }

    _onCancelControllerTimer();

    _showStatusBar();

    super.dispose();
  }

  void _onShowPlayerController() {
    showPlayerController = true;

    _onCancelControllerTimer();
    _initControllerTimer();

    setState(() {});
  }

  void _onHideController() {
    _onCancelControllerTimer();

    setState(() {
      showPlayerController = false;
    });
  }

  void _onTapPrevious() {
    if (currentIndex == 0) {
      return;
    }

    _onCancelControllerTimer();
    _initControllerTimer();

    _initialVideoPlayerController(widget.contents[--currentIndex]);

    setState(() {});
  }

  void _onTapNext() {
    if (currentIndex == widget.contents.length - 1) {
      return;
    }

    _onCancelControllerTimer();
    _initControllerTimer();

    _initialVideoPlayerController(widget.contents[++currentIndex]);

    setState(() {});
  }

  void _onTapBookmark() {
    isBookmarked = !isBookmarked;

    _onCancelControllerTimer();
    _initControllerTimer();

    widget.onTapBookmark(isBookmarked);

    setState(() {});
  }

  void _onTapCheckPoint() {
    _onCancelControllerTimer();
    _initControllerTimer();

    setState(() {
      showCheckPoint = !showCheckPoint;
    });
  }

  void _onCloseCheckPoint() {
    setState(() {
      showCheckPoint = false;
    });
  }

  void _onTapFullScreen() {
    isFullScreen = !isFullScreen;

    _onCancelControllerTimer();
    _initControllerTimer();

    if (isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    } else {
      _showStatusBar();
    }

    setState(() {});
  }

  void _onTapRepeat(RepeatMode mode) {
    _onCancelControllerTimer();
    _initControllerTimer();

    setState(() {
      repeatMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isFullScreen
        ? _buildPlayer()
        : Parents(
            title: 'Video player',
            body: Align(
              alignment: Alignment.topCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48.w,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(child: _buildPlayer()),
                        if (widget.showBottomButtons)
                          PlayerBottomButtons(
                            onTapPrevious:
                                currentIndex == 0 ? null : _onTapPrevious,
                            onTapNext:
                                currentIndex == widget.contents.length - 1
                                    ? null
                                    : _onTapNext,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Widget _buildPlayer() {
    return Material(
      child: Container(
        color: Colors.black,
        child: Stack(
          children: [
            if (controller != null)
              Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VideoPlayer(controller!),
                ),
              ),
            SeekToControl(
              controller: controller,
              onShowController: _onShowPlayerController,
              onTapFullScreen: _onTapFullScreen,
              seekTime: seekTime,
              isFullScreen: isFullScreen,
            ),
            if (controller != null && showPlayerController)
              Positioned.fill(
                child: PlayerController(
                  controller: controller!,
                  contents: widget.contents,
                  currentIndex: currentIndex,
                  onTapPrevious: _onTapPrevious,
                  onTapNext: _onTapNext,
                  onShowController: _onShowPlayerController,
                  onHideController: _onHideController,
                  onTapBookmark: _onTapBookmark,
                  onTapCheckPoint: _onTapCheckPoint,
                  onTapFullScreen: _onTapFullScreen,
                  onTapRepeat: _onTapRepeat,
                  isBookmarked: isBookmarked,
                  isFullScreen: isFullScreen,
                  isMultiplePlaylist: widget.contents.length > 1,
                  repeatMode: repeatMode,
                ),
              ),
            if (showCheckPoint)
              CheckPoint(onCloseCheckPoint: _onCloseCheckPoint),
          ],
        ),
      ),
    );
  }
}
