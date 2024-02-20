import 'package:all_in_one_flutter/feat/drag_drop/model/curriculum.dart';
import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DragDropListItem extends StatelessWidget {
  DragDropListItem({
    super.key,
    required this.type,
    this.isRequired = false,
    this.isSelected = false,
    required this.title,
    this.count = 0,
    this.grade,
  }) {
    if (type == CurriculumType.lecture && grade == null) {
      throw Exception('What the....');
    }
  }

  final CurriculumType type;
  final bool isRequired;
  final bool isSelected;
  final String title;
  final int count;
  final String? grade;

  @override
  Widget build(BuildContext context) {
    Widget rightChild;
    if (type == CurriculumType.lecture) {
      rightChild = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          gradeBadge(grade: grade!, isSelected: isSelected),
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
                  style: TextStyle(fontSize: 5.sp, color: Colors.white),
                ),
              ),
              Text(
                '-$count',
                style: TextStyle(fontSize: 12.sp, color: Colors.green),
              ),
            ],
          )
        ],
      );
    } else if (type == CurriculumType.problem) {
      rightChild = Text(
        '$count개',
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: Colors.green),
      );
    } else {
      rightChild = Container();
    }

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.w, 5.w, 16.w, 5.w),
          child: Opacity(
            opacity: 1.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
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
                            style: TextStyle(
                                fontSize: 12.sp, color: Colors.grey[200]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: rightChild,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isRequired)
          Row(
            children: [
              Assets.images.dragDrop.icBadge.image(width: 32.w),
            ],
          )
      ],
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
