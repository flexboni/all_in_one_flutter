import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayerBottomButtons extends StatelessWidget {
  const PlayerBottomButtons({
    super.key,
    required this.onTapPrevious,
    required this.onTapNext,
  });

  final void Function()? onTapPrevious;
  final void Function()? onTapNext;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.w,
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: onTapPrevious,
            child: const Text(Strings.PREVIOUS),
          ),
          TextButton(
            onPressed: onTapNext,
            child: const Text(Strings.NEXT),
          ),
        ],
      ),
    );
  }
}
