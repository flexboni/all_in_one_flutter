import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DragDropListItem extends StatelessWidget {
  const DragDropListItem({
    super.key,
    this.isSelected = false,
    required this.title,
    this.count = 0,
    required this.grade,
    required this.day,
  });

  final bool isSelected;
  final String title;
  final int count;
  final String grade;
  final int day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Opacity(
        opacity: 1.0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.grey,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '학습 횟수 : $count',
                        style:
                            TextStyle(fontSize: 12.sp, color: Colors.grey[200]),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      gradeBadge(grade: grade, isSelected: isSelected),
                      Row(
                        children: [
                          Container(
                            width: 14.w,
                            height: 14.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90.r),
                              color: Colors.green,
                            ),
                            child: Text(
                              'D',
                              style: TextStyle(
                                  fontSize: 5.sp, color: Colors.white),
                            ),
                          ),
                          Text(
                            '-$day',
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.green),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget gradeBadge({required String grade, required bool isSelected}) {
    Color? color;
    if (isSelected) {
      switch (grade) {
        case 'A+':
        case 'A-':
        case 'A':
          color = Colors.yellow[300];
          break;

        case 'B+':
        case 'B-':
        case 'B':
          color = Colors.grey[300];
          break;

        default:
          color = Colors.brown[300];
      }
    } else {
      switch (grade) {
        case 'A+':
        case 'A-':
        case 'A':
          color = Colors.yellow;
          break;

        case 'B+':
        case 'B-':
        case 'B':
          color = Colors.grey;
          break;

        default:
          color = Colors.brown;
      }
    }

    return Container(
      width: 24.w,
      height: 24.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90.r),
        border: Border.all(width: 2, color: color ?? Colors.black),
        color: Colors.white,
      ),
      child: Text(
        grade,
        style: TextStyle(fontSize: 12.sp, color: color),
      ),
    );
  }
}
