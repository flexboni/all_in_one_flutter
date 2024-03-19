import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:video_player/video_player.dart';

class SeekToControl extends StatefulWidget {
  /// Double tap 으로 앞이나 뒤로 player 이동하는 widget
  const SeekToControl({
    super.key,
    this.controller,
    required this.onShowController,
    required this.onTapFullScreen,
    required this.seekTime,
    required this.isFullScreen,
  });

  final VideoPlayerController? controller;
  final void Function() onShowController;
  final void Function() onTapFullScreen;
  final int seekTime;
  final bool isFullScreen;

  @override
  State<SeekToControl> createState() => _SeekToControlState();
}

class _SeekToControlState extends State<SeekToControl>
    with TickerProviderStateMixin {
  late GifController _controller;

  bool showPrevious = false;
  bool showForward = false;

  @override
  void initState() {
    super.initState();

    _controller = GifController(vsync: this)
      ..addStatusListener(
        (status) {
          if ((showPrevious || showForward) &&
              status == AnimationStatus.completed) {
            setState(() {
              showPrevious = false;
              showForward = false;
            });
          }
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onDoubleTapDown: (TapDownDetails details) {
          if (widget.controller == null) {
            return;
          }

          final double width = context.size!.width;
          final double localWidth = details.localPosition.dx;
          final int nowPlayTime =
              widget.controller!.value.position.inMilliseconds;
          // seekTime 만큼 뒤로 가기
          if (localWidth < width * 2 / 5) {
            int reduceTime = nowPlayTime - widget.seekTime;
            if (reduceTime < 0) {
              reduceTime = 0;
            }

            widget.controller!.seekTo(Duration(milliseconds: reduceTime));

            showPrevious = true;
          } else if (localWidth > width * 3 / 5) {
            // seekTime 만큼 앞으로 가기
            int increaseTime = nowPlayTime + widget.seekTime;
            final int endTime =
                widget.controller!.value.duration.inMilliseconds;
            if (increaseTime > endTime) {
              increaseTime = endTime - widget.seekTime;
            }

            widget.controller!.seekTo(Duration(milliseconds: increaseTime));

            showForward = true;
          }

          setState(() {});
        },
        onTap: widget.onShowController,
        onVerticalDragUpdate: (details) {
          if (!widget.isFullScreen && details.delta.dy < -10.0) {
            widget.onTapFullScreen();
          } else if (widget.isFullScreen && details.delta.dy > 10.0) {
            widget.onTapFullScreen();
          }
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: showPrevious
                    ? Center(
                        child: Gif(
                          controller: _controller,
                          autostart: Autostart.once,
                          image:
                              AssetImage(Assets.images.gif.previous10Sec.path),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              const Expanded(child: SizedBox.shrink()),
              Expanded(
                flex: 2,
                child: showForward
                    ? Center(
                        child: Gif(
                          controller: _controller,
                          autostart: Autostart.once,
                          image:
                              AssetImage(Assets.images.gif.forward10Sec.path),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
