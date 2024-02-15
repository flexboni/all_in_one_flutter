import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:all_in_one_flutter/core/utils/utils.dart';
import 'package:all_in_one_flutter/feat/pencil/model/question.dart';
import 'package:all_in_one_flutter/feat/pencil/screen/view/custom_html.dart';
import 'package:all_in_one_flutter/feat/pencil/screen/view/problem_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:go_router/go_router.dart';

/// 모든 문제 보여주기 Drawer
class ProblemListDrawer extends StatefulWidget {
  const ProblemListDrawer({super.key, required this.questions});

  final List<Question> questions;

  @override
  State<ProblemListDrawer> createState() => _ProblemListDrawerState();
}

class _ProblemListDrawerState extends State<ProblemListDrawer> {
  bool isSwitched = false;
  late List<Question> questions;

  @override
  void initState() {
    super.initState();

    questions = widget.questions;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.6,
      shape: const RoundedRectangleBorder(),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(35.w, 40.w, 35.w, 0),
        child: Column(
          children: [
            _buildTop(),
            _buildContents(),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.22,
          child: SwitchListTile(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
            title: const Text(Strings.TEXT_END_DRAWER_SWITCH_TITLE),
            thumbColor: const MaterialStatePropertyAll(Colors.white),
          ),
        ),
        IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.close_rounded),
        ),
      ],
    );
  }

  Widget _buildContents() {
    List<Question> newQuestions = questions;
    if (isSwitched) {
      newQuestions = newQuestions
          .where((element) => element.problemAnswer == null)
          .toList();
    }

    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverGrid.builder(
            itemCount: newQuestions.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 9 / 10,
              mainAxisSpacing: 24.w,
              crossAxisSpacing: 24.w,
            ),
            itemBuilder: (_, int index) {
              final item = newQuestions[index];
              final bool isSubjective = item.answers.length == 1;

              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: CustomTexView(
                        index: questions.indexOf(item),
                        question: item,
                        padding: const TeXViewPadding.only(
                            left: 20, top: 30, right: 20, bottom: 30),
                      ),
                    ),
                    const Divider(),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.w, vertical: 19.w),
                        child: isSubjective
                            ? Container(
                                alignment: Alignment.center,
                                decoration:
                                    WidgetUtils.basicRoundedBoxDecoration(),
                                child: CustomHtml(
                                  value: item.problemAnswer ?? '',
                                ),
                              )
                            : MultipleAnswerInput(question: item),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          SliverPadding(padding: EdgeInsets.only(bottom: 54.w))
        ],
      ),
    );
  }
}
