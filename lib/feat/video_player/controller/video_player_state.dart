import 'package:all_in_one_flutter/feat/video_player/model/content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_player_state.freezed.dart';

@freezed
class VideoPlayerState with _$VideoPlayerState {
  const factory VideoPlayerState({
    required List<Content> contents,
    required int currentIndex,
  }) = _VideoPlayerState;

  factory VideoPlayerState.initial() => const VideoPlayerState(
        contents: [],
        currentIndex: 0,
      );
}
