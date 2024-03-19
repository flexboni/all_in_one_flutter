import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

enum RepeatMode { none, one, all }

class PlayRepeatButton extends StatelessWidget {
  const PlayRepeatButton({
    super.key,
    required this.controller,
    required this.repeatMode,
    required this.isMultiplePlaylist,
    this.onTapRepeat,
  });

  final VideoPlayerController controller;
  final RepeatMode repeatMode;
  final bool isMultiplePlaylist;
  final void Function(RepeatMode mode)? onTapRepeat;

  void _onTapRepeat() {
    RepeatMode mode;
    if (isMultiplePlaylist && repeatMode == RepeatMode.one) {
      mode = RepeatMode.all;
    } else if (repeatMode == RepeatMode.none) {
      mode = RepeatMode.one;
    } else {
      mode = RepeatMode.none;
    }

    controller.setLooping(mode == RepeatMode.one);

    if (onTapRepeat != null) {
      onTapRepeat!(mode);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget icon;
    switch (repeatMode) {
      case RepeatMode.one:
        icon = Assets.icons.player.repeatOne.svg();
        break;
      case RepeatMode.all:
        icon = Assets.icons.player.repeatAll.svg();
        break;
      default:
        icon = Assets.icons.player.repeat.svg();
    }

    return IconButton(onPressed: _onTapRepeat, icon: icon);
  }
}
