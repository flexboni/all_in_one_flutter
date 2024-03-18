import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:all_in_one_flutter/feat/video_player/model/content.dart';
import 'package:all_in_one_flutter/feat/video_player/view/check_point.dart';
import 'package:all_in_one_flutter/feat/video_player/view/player_controller.dart';
import 'package:all_in_one_flutter/feat/video_player/view/seek_to_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class NormalScreenVideo extends StatefulWidget {
  const NormalScreenVideo({
    super.key,
    required this.controller,
    required this.content,
    required this.onTapPrevious,
    required this.onTapNext,
    required this.onShowController,
    required this.onHideController,
    required this.onTapBookmark,
    required this.onTapCheckPoint,
    required this.onCloseCheckPoint,
    required this.onTapRepeat,
    required this.seekTime,
    required this.showController,
    required this.isBookmarked,
    required this.showCheckPoint,
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
  final void Function() onTapBookmark;
  final void Function() onTapCheckPoint;
  final void Function() onCloseCheckPoint;
  final void Function() onTapRepeat;
  final int seekTime;
  final bool showController;
  final bool isBookmarked;
  final bool showCheckPoint;
  final Color buttonColor;
  final double fullScreenIconSize;
  final double controllerIconSize;

  @override
  State<NormalScreenVideo> createState() => _NormalScreenVideoState();
}

class _NormalScreenVideoState extends State<NormalScreenVideo> {
  bool isFullScreen = false;

  void _showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  void _onTapFullScreen() {
    isFullScreen = !isFullScreen;

    if (isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    } else {
      _showStatusBar();
    }

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();

    _showStatusBar();
  }

  @override
  Widget build(BuildContext context) {
    return isFullScreen
        ? _buildPlayer()
        : Parents(
            title: 'Video player',
            body: Align(
              alignment: Alignment.topCenter,
              child: widget.controller.value.isInitialized
                  ? Row(
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
                              // TODO
                              Container(
                                height: 48.w,
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text('이전'),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text('다음'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
          );
  }

  Widget _buildPlayer() {
    return Material(
      child: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: VideoPlayer(widget.controller),
              ),
            ),
            SeekToControl(
              controller: widget.controller,
              onShowController: widget.onShowController,
              onTapFullScreen: _onTapFullScreen,
              seekTime: widget.seekTime,
              isFullScreen: isFullScreen,
            ),
            if (widget.showController)
              Positioned.fill(
                child: PlayerController(
                  controller: widget.controller,
                  content: widget.content,
                  onTapPrevious: widget.onTapPrevious,
                  onTapNext: widget.onTapNext,
                  onShowController: widget.onShowController,
                  onHideController: widget.onHideController,
                  onTapBookmark: widget.onTapBookmark,
                  onTapCheckPoint: widget.onTapCheckPoint,
                  onTapFullScreen: _onTapFullScreen,
                  onTapRepeat: widget.onTapRepeat,
                  buttonColor: widget.buttonColor,
                  fullScreenIconSize: widget.fullScreenIconSize,
                  controllerIconSize: widget.controllerIconSize,
                  isBookmarked: widget.isBookmarked,
                  isFullScreen: isFullScreen,
                ),
              ),
            if (widget.showCheckPoint)
              CheckPoint(
                onCloseCheckPoint: widget.onCloseCheckPoint,
              ),
          ],
        ),
      ),
    );
  }
}
