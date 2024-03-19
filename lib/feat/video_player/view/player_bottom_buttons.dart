import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:all_in_one_flutter/core/widgets/widgets.dart';
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
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.r),
      ),
      textStyle: TextStyle(fontSize: 12.sp),
      foregroundColor: Colors.black,
      backgroundColor: AppColors.GRAY_EA,
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.w),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: onTapPrevious,
            style: buttonStyle,
            child: const Text(Strings.PREVIOUS),
          ),
          SpaceH(size: 16.w),
          ElevatedButton(
            onPressed: onTapNext,
            style: buttonStyle,
            child: const Text(Strings.NEXT),
          ),
        ],
      ),
    );
  }
}
