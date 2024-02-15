import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetUtils {
  const WidgetUtils._();

  static BoxDecoration basicRoundedBoxDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(),
      );
}
