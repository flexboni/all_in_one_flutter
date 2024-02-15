import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  const ToastUtils._();

  static Future<bool?> show(String msg, {Toast length = Toast.LENGTH_LONG}) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: length,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black.withOpacity(0.8),
      textColor: Colors.white,
      fontSize: 16.sp,
    );
  }

  static Future<bool?> error(String msg, {Toast length = Toast.LENGTH_LONG}) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: length,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red.withOpacity(0.8),
      textColor: Colors.white,
      fontSize: 16.sp,
    );
  }
}
