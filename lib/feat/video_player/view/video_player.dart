import 'dart:async';

import 'package:all_in_one_flutter/feat/video_player/model/content.dart';
import 'package:all_in_one_flutter/feat/video_player/view/change_video_buttons.dart';
import 'package:all_in_one_flutter/feat/video_player/view/check_point.dart';
import 'package:all_in_one_flutter/feat/video_player/view/play_repeat_button.dart';
import 'package:all_in_one_flutter/feat/video_player/view/player_controller.dart';
import 'package:all_in_one_flutter/feat/video_player/view/playlist.dart';
import 'package:all_in_one_flutter/feat/video_player/view/seek_to_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart' as vp;

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({
    super.key,
    required this.contents,
    required this.onTapBookmark,
    this.showBottomButtons = true,
    this.isPopup = false,
  });

  final List<Content> contents;
  final void Function(bool isBookmarked) onTapBookmark;
  final bool showBottomButtons;
  final bool isPopup;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  bool isFullScreen = false;
  vp.VideoPlayerController? controller;

  bool showPlayerController = false;
  bool isBookmarked = false;
  bool showCheckPoint = false;
  bool showPlaylist = false;

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

    controller =
        vp.VideoPlayerController.networkUrl(Uri.parse(content.urlVideo));
    await controller!.initialize();
    controller!
      ..play()
      ..addListener(listener);
  }

  @override
  void initState() {
    super.initState();

    isFullScreen = widget.isPopup;

    if (widget.contents.isNotEmpty) {
      _initialVideoPlayerController(widget.contents.first);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isFullScreen) {
        _hideStatusBar();
      }
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

    _initialVideoPlayerController(widget.contents[--currentIndex]);

    _onShowPlayerController();
  }

  void _onTapNext() {
    if (currentIndex == widget.contents.length - 1) {
      return;
    }

    _initialVideoPlayerController(widget.contents[++currentIndex]);

    _onShowPlayerController();
  }

  void _onTapBookmark() {
    isBookmarked = !isBookmarked;

    widget.onTapBookmark(isBookmarked);

    _onShowPlayerController();
  }

  void _onTapCheckPoint() {
    showCheckPoint = !showCheckPoint;

    _onShowPlayerController();
  }

  void _onTapCloseCheckPoint() {
    setState(() {
      showCheckPoint = false;
    });
  }

  void _onTapFullScreen() {
    isFullScreen = !isFullScreen;

    if (isFullScreen) {
      _hideStatusBar();
    } else {
      _showStatusBar();
    }

    _onShowPlayerController();
  }

  void _onTapRepeat(RepeatMode mode) {
    repeatMode = mode;

    _onShowPlayerController();
  }

  void _onTapPlayList() {
    showPlaylist = true;

    _onShowPlayerController();
  }

  void _onTapClosePlaylist() {
    setState(() {
      showPlaylist = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isFullScreen
        ? _buildPlayer()
        : Column(
            children: [
              Expanded(child: _buildPlayer()),
              if (!widget.isPopup && widget.showBottomButtons)
                ChangeVideoButtons(
                  onTapPrevious: currentIndex == 0 ? null : _onTapPrevious,
                  onTapNext: currentIndex == widget.contents.length - 1
                      ? null
                      : _onTapNext,
                ),
            ],
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
                  child: vp.VideoPlayer(controller!),
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
                  onTapPlaylist: _onTapPlayList,
                  isBookmarked: isBookmarked,
                  isFullScreen: isFullScreen,
                  isMultiplePlaylist: widget.contents.length > 1,
                  isPopup: widget.isPopup,
                  repeatMode: repeatMode,
                ),
              ),
            if (showCheckPoint) CheckPoint(onClose: _onTapCloseCheckPoint),
            if (showPlaylist)
              Playlist(
                onClose: _onTapClosePlaylist,
                currentIndex: currentIndex,
                contents: widget.contents,
              ),
          ],
        ),
      ),
    );
  }
}
