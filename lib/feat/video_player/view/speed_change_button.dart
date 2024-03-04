import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class SpeedChangeButton extends StatelessWidget {
  const SpeedChangeButton({
    super.key,
    required this.controller,
    required this.onShowController,
  });

  final VideoPlayerController controller;
  final void Function() onShowController;

  void _onPressed(BuildContext context) {
    final double radius = 20.0.r;
    const EdgeInsets padding = EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 30,
    );
    final List<double> items = [
      0.25,
      0.5,
      0.75,
      1.0,
      1.25,
      1.5,
      1.75,
      2,
    ];

    showModalBottomSheet<void>(
      context: context,
      barrierColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
      ),
      builder: (BuildContext context) {
        return Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(radius)),
              ),
              color: Colors.black,
            ),
            child: ListView.separated(
              padding: padding,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final double item = items[index];
                final bool isSelected = controller.value.playbackSpeed == item;
                return ListTile(
                  onTap: () {
                    controller.setPlaybackSpeed(item);
                    context.pop();
                  },
                  selected: isSelected,
                  selectedColor: Colors.red,
                  textColor: Colors.white,
                  titleTextStyle: TextStyle(fontSize: 20.sp),
                  title: Text(item.toString()),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 5),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double fontSize = 20.sp;

    return TextButton.icon(
      onPressed: () {
        _onPressed(context);
        onShowController();
      },
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Colors.white,
        size: fontSize,
      ),
      label: Text(
        '${controller.value.playbackSpeed}',
        style: TextStyle(color: Colors.white, fontSize: fontSize),
      ),
    );
  }
}
