import 'package:all_in_one_flutter/core/utils/app_date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class PlayerSlider extends StatelessWidget {
  const PlayerSlider({
    super.key,
    required this.controller,
    required this.onShowController,
  });

  final VideoPlayerController controller;
  final void Function() onShowController;

  @override
  Widget build(BuildContext context) {
    final Duration value = controller.value.position;
    final Duration max = controller.value.duration;

    return Padding(
      padding: EdgeInsets.only(left: 12.w, right: 24.w),
      child: Row(
        children: [
          Expanded(
            child: SliderTheme(
              data: const SliderThemeData(
                trackHeight: 2,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
              ),
              child: Slider(
                value: value.inSeconds.toDouble(),
                max: max.inSeconds.toDouble(),
                onChanged: (double value) {
                  onShowController();

                  controller.seekTo(Duration(seconds: value.toInt()));
                },
                activeColor: Colors.green,
                inactiveColor: Colors.grey,
              ),
            ),
          ),
          Text(
            AppDateUtils.convertDurationToMMSS(value),
            style: TextStyle(color: Colors.white, fontSize: 12.sp),
          ),
          Text(
            '/ ${AppDateUtils.convertDurationToMMSS(max)}',
            style: TextStyle(color: Colors.grey, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
