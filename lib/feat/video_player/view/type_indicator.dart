import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:all_in_one_flutter/feat/video_player/model/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypeIndicator extends StatelessWidget {
  const TypeIndicator({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    return // Type
        Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.w),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.r),
        ),
        color: type == Keys.LECTURE_TYPE_CONCEPT ? Colors.green : Colors.orange,
      ),
      child: Text(
        Content.lectureTypeToName(type),
        style: TextStyle(
          color: Colors.white,
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
