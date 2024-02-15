import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedTextButton extends StatelessWidget {
  const RoundedTextButton({
    super.key,
    this.onPressed,
    this.onLongPress,
    required this.text,
    this.padding,
    this.textStyle,
    this.backgroundColors,
  });

  final void Function()? onPressed;
  final void Function()? onLongPress;
  final String text;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final Color? backgroundColors;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: TextButton.styleFrom(
        backgroundColor:
            backgroundColors ?? Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        textStyle: textStyle ?? TextStyle(fontSize: 16.sp),
        padding:
            padding ?? EdgeInsets.symmetric(vertical: 13.w, horizontal: 18.w),
      ),
      child: Text(text),
    );
  }
}
