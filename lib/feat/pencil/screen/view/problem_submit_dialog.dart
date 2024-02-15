import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProblemSubmitDialog extends StatelessWidget {
  const ProblemSubmitDialog({
    super.key,
    required this.title,
    required this.content,
    this.extra,
    this.rightButtonText,
  });

  final String title;
  final String content;
  final String? extra;
  final String? rightButtonText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            content,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          if (extra != null)
            Text(
              extra!,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.red),
            ),
        ],
      ),
      titlePadding: EdgeInsets.only(top: 48.w),
      contentPadding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 22.w),
      backgroundColor: Colors.white,
      elevation: 0.0,
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          style: Theme.of(context).textButtonTheme.style?.copyWith(
                foregroundColor: MaterialStatePropertyAll(Colors.grey[400]),
              ),
          child: const Text(Strings.CANCEL),
        ),
        TextButton(
          onPressed: () => context.pop(true),
          child: Text(rightButtonText ?? Strings.SUBMIT),
        ),
      ],
    );
  }
}
