import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProblemSlider extends StatelessWidget {
  const ProblemSlider({
    super.key,
    required this.onChanged,
    required this.value,
    this.max = 0,
    this.secondaryTrackValue,
  });

  final void Function(double value) onChanged;
  final double max;
  final double value;
  final double? secondaryTrackValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Slider(
            onChanged: onChanged,
            value: value,
            max: max,
            thumbColor: Colors.white,
            secondaryTrackValue: secondaryTrackValue,
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveColor: Colors.grey,
            secondaryActiveColor: Colors.grey[200],
          ),
        ),
        SizedBox(
          width: 50.w,
          child: Text('${(value + 1).toInt()} / ${(max + 1).toInt()}'),
        ),
        SizedBox(height: 40.w),
      ],
    );
  }
}
