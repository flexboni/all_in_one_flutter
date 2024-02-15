import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpaceH extends StatelessWidget {
  const SpaceH({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size ?? 8.w);
  }
}

class SpaceV extends StatelessWidget {
  const SpaceV({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size ?? 8.w);
  }
}
