import 'package:all_in_one_flutter/core/utils/utils.dart';
import 'package:all_in_one_flutter/feat/pencil/model/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectiveAnswerInput extends ConsumerStatefulWidget {
  const SubjectiveAnswerInput({
    super.key,
    required this.question,
    required this.onResult,
  });

  final Question question;
  final void Function(String? value) onResult;

  @override
  ConsumerState<SubjectiveAnswerInput> createState() =>
      _SubjectiveAnswerInputState();
}

class _SubjectiveAnswerInputState extends ConsumerState<SubjectiveAnswerInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.question.problemAnswer);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: TextField(
            controller: _controller,
            onChanged: widget.onResult,
            decoration: InputDecoration(
                border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            )),
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.grey),
          ),
        ),
        IconButton(
          onPressed: () {
            widget.onResult('?');
          },
          style: IconButton.styleFrom(
            backgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
            side: const BorderSide(color: Colors.grey),
            padding: EdgeInsets.symmetric(vertical: 12.w),
          ),
          icon: const Icon(Icons.question_mark_rounded, color: Colors.white),
        ),
      ],
    );
  }
}

/// 객관식 답 입력
class MultipleAnswerInput extends StatefulWidget {
  const MultipleAnswerInput({
    super.key,
    this.onResult,
    required this.question,
    this.width,
  });

  final void Function(String? value)? onResult;
  final Question question;
  final double? width;

  @override
  State<MultipleAnswerInput> createState() => _MultipleAnswerInputState();
}

class _MultipleAnswerInputState extends State<MultipleAnswerInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: WidgetUtils.basicRoundedBoxDecoration(),
      padding: EdgeInsets.symmetric(vertical: 6.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buttonBase(text: '1'),
          _buttonBase(text: '2'),
          _buttonBase(text: '3'),
          _buttonBase(text: '4'),
          _buttonBase(text: '5'),
          _buttonBase(text: '?'),
        ],
      ),
    );
  }

  Widget _buttonBase({required String text}) {
    bool isSelected = widget.question.problemAnswer == text;

    return InkWell(
      onTap: widget.onResult != null ? () => widget.onResult!(text) : null,
      child: Container(
        width: 20.w,
        height: 32.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(45.r),
          color: isSelected ? Colors.grey : null,
        ),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
