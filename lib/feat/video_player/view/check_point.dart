import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckPoint extends StatelessWidget {
  const CheckPoint({super.key, required this.onCloseCheckPoint});

  final void Function() onCloseCheckPoint;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.w),
        color: Colors.black.withOpacity(0.4),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    Strings.CHECK_POINT,
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  ),
                ),
                IconButton(
                  onPressed: onCloseCheckPoint,
                  icon: Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 30.sp,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (_, index) {
                  return Container(
                    width: 300.w,
                    color: Colors.white,
                  );
                },
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) => const SpaceH(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
