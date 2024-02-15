library problem_view;

import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:all_in_one_flutter/feat/pencil/controller/pencil_controller.dart';
import 'package:all_in_one_flutter/feat/pencil/controller/pencil_state.dart';
import 'package:all_in_one_flutter/feat/pencil/model/question.dart';
import 'package:all_in_one_flutter/feat/pencil/screen/view/problem_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

export 'answer_input.dart';
export 'custom_tex_view.dart';
export 'problem_drawer.dart';
export 'problem_slider.dart';
export 'problem_submit_dialog.dart';

class ProblemView extends ConsumerWidget {
  const ProblemView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<PencilState> pencilState =
        ref.watch(pencilControllerProvider);

    return pencilState.when(
      data: (data) {
        final Question question = data.exam.questions[data.currentIndex];
        return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(56.w, 0, 56.w, 56.w),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            margin: EdgeInsets.only(top: 44.w),
            child: CustomTexView(
              index: data.currentIndex,
              question: question,
            ),
          ),
        );
      },
      error: (error, stacktrace) {
        return ErrorDefault(error: error.toString());
      },
      loading: () {
        return const ProgressBar();
      },
    );
  }
}

class ProblemSliderWithMoveButtons extends StatelessWidget {
  const ProblemSliderWithMoveButtons({
    super.key,
    required this.onChangedSlider,
    this.onPrevious,
    this.onNext,
    this.onFinish,
    this.onLongPress,
    required this.sliderValue,
    required this.maxValue,
    required this.secondaryTrackValue,
  });

  final void Function(double value) onChangedSlider;
  final void Function()? onPrevious;
  final void Function()? onNext;
  final void Function()? onFinish;
  final void Function()? onLongPress;
  final double sliderValue;
  final double maxValue;
  final double secondaryTrackValue;

  @override
  Widget build(BuildContext context) {
    final bool isFinish = maxValue == sliderValue;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 6.w),
      color: Colors.grey,
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ProblemSlider(
                onChanged: onChangedSlider,
                value: sliderValue,
                secondaryTrackValue: secondaryTrackValue,
                max: maxValue,
              ),
            ),
            Row(
              children: [
                RoundedTextButton(
                  onPressed: onPrevious,
                  textStyle: TextStyle(fontSize: 12.sp),
                  backgroundColors: Colors.black,
                  text: Strings.PREVIOUS_PROBLEM,
                ),
                SpaceH(size: 16.w),
                if (isFinish)
                  RoundedTextButton(
                    onPressed: onFinish,
                    onLongPress: onLongPress,
                    textStyle: TextStyle(fontSize: 12.sp),
                    backgroundColors: Colors.black,
                    text: Strings.SUBMIT,
                  )
                else
                  RoundedTextButton(
                    onPressed: onNext,
                    textStyle: TextStyle(fontSize: 12.sp),
                    backgroundColors: Colors.black,
                    text: Strings.NEXT_PROBLEM,
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
