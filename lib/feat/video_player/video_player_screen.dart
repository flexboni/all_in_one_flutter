import 'dart:async';

import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:all_in_one_flutter/core/utils/toast_utils.dart';
import 'package:all_in_one_flutter/feat/video_player/controller/app_video_player_controller.dart';
import 'package:all_in_one_flutter/feat/video_player/controller/video_player_state.dart';
import 'package:all_in_one_flutter/feat/video_player/model/content.dart';
import 'package:all_in_one_flutter/feat/video_player/view/full_screen_video.dart';
import 'package:all_in_one_flutter/feat/video_player/view/normal_screen_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends ConsumerStatefulWidget {
  const VideoPlayerScreen({
    super.key,
    this.seekTime = 10000,
    this.fullScreenIconSize = 40,
    this.controllerIconSize = 100,
    this.buttonColor = Colors.white,
  });

  final int seekTime;
  final double fullScreenIconSize;
  final double controllerIconSize;
  final Color buttonColor;

  @override
  ConsumerState<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends ConsumerState<VideoPlayerScreen> {
  VideoPlayerController? controller;

  bool isFullScreen = false;
  bool showController = false;
  bool isBookmarked = false;
  bool showCheckPoint = false;

  Timer? controllerTimer;

  void listener() {
    setState(() {});
  }

  void _initialVideoPlayerController(Content content) {
    if (controller != null) {
      controller!.pause();
      controller!.removeListener(listener);
    }

    controller = VideoPlayerController.networkUrl(Uri.parse(content.urlVideo))
      ..initialize().then((_) => listener())
      ..play()
      ..addListener(listener);
  }

  @override
  void initState() {
    super.initState();

    ref.listenManual(
      appVideoPlayerControllerProvider,
      (previous, next) {
        if (next.hasError && previous != next) {
          ToastUtils.error(next.error.toString());
        }
        if (previous != next &&
            next.value?.currentIndex != null &&
            next.value!.contents.isNotEmpty) {
          _initialVideoPlayerController(
            next.value!.contents[next.value!.currentIndex],
          );
        }
      },
    );
  }

  @override
  void dispose() {
    if (controller != null) {
      controller!
        ..pause()
        ..removeListener(listener)
        ..dispose();
    }

    if (controllerTimer != null) {
      controllerTimer!.cancel();
    }
    super.dispose();
  }

  void onShowController() {
    showController = true;

    if (controllerTimer != null) {
      controllerTimer!.cancel();
      controllerTimer = null;
    }

    controllerTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        showController = false;
      });
    });

    setState(() {});
  }

  void onHideController() {
    setState(() {
      showController = false;
      if (controllerTimer != null) {
        controllerTimer!.cancel();
      }
    });
  }

  void onTapPrevious() {
    final int? currentIndex =
        ref.read(appVideoPlayerControllerProvider).value?.currentIndex;
    if (currentIndex == null || currentIndex - 1 < 0 || controller == null) {
      return;
    }

    ref.read(appVideoPlayerControllerProvider.notifier).onTapPrevious();
    controller!
      ..pause()
      ..play();
  }

  void onTapNext() {
    final VideoPlayerState? state =
        ref.read(appVideoPlayerControllerProvider).value;
    final int? currentIndex = state?.currentIndex;
    final List<Content>? contents = state?.contents;
    if (currentIndex == null ||
        contents == null ||
        controller == null ||
        currentIndex + 1 >= contents.length) {
      return;
    }

    ref.read(appVideoPlayerControllerProvider.notifier).onTapNext();
    controller!
      ..pause()
      ..play();
  }

  void _onTapBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  void _onTapCheckPoint() {
    setState(() {
      showCheckPoint = !showCheckPoint;
    });
  }

  void _onCloseCheckPoint() {
    setState(() {
      showCheckPoint = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<VideoPlayerState> state =
        ref.watch(appVideoPlayerControllerProvider);

    if (controller == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return state.when(
      data: (state) {
        final List<Content> contents = state.contents;
        final int currentIndex = state.currentIndex;

        return isFullScreen
            ? FullScreenVideo(
                controller: controller!,
                content: contents[currentIndex],
                onTapPrevious: onTapPrevious,
                onTapNext: onTapNext,
                onTapFullScreen: () {
                  setState(() {
                    isFullScreen = false;
                  });
                },
                onShowController: onShowController,
                onHideController: onHideController,
                onTapBookmark: _onTapBookmark,
                onTapCheckPoint: _onTapCheckPoint,
                onCloseCheckPoint: _onCloseCheckPoint,
                seekTime: widget.seekTime,
                showController: showController,
                isBookmarked: isBookmarked,
                showCheckPoint: showCheckPoint,
                controllerIconSize: widget.controllerIconSize,
                fullScreenIconSize: widget.fullScreenIconSize,
                buttonColor: widget.buttonColor,
              )
            : NormalScreenVideo(
                controller: controller!,
                content: contents[currentIndex],
                onTapPrevious: onTapPrevious,
                onTapNext: onTapNext,
                onTapFullScreen: () {
                  setState(() {
                    isFullScreen = true;
                  });
                },
                onShowController: onShowController,
                onHideController: onHideController,
                onTapBookmark: _onTapBookmark,
                onTapCheckPoint: _onTapCheckPoint,
                onCloseCheckPoint: _onCloseCheckPoint,
                seekTime: widget.seekTime,
                showController: showController,
                isBookmarked: isBookmarked,
                showCheckPoint: showCheckPoint,
                controllerIconSize: widget.controllerIconSize,
                fullScreenIconSize: widget.fullScreenIconSize,
                buttonColor: widget.buttonColor,
              );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(
              '${Strings.ERROR_STATE_INFO_IS_NULL}/n error: $error, stackTrace: $stackTrace'),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
