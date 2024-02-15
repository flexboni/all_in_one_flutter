import 'package:all_in_one_flutter/core/utils/font_utils.dart';
import 'package:all_in_one_flutter/core/widgets/progress_bar.dart';
import 'package:all_in_one_flutter/feat/pencil/model/question.dart';
import 'package:all_in_one_flutter/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class CustomTexView extends StatelessWidget {
  const CustomTexView(
      {super.key, required this.index, required this.question, this.padding});

  final int index;
  final Question question;
  final TeXViewPadding? padding;

  @override
  Widget build(BuildContext context) {
    String content = question.contentQuestion != null
        ? '${index + 1}. ${question.contentQuestion}'
        : '';
    String transferQuestionNumberInfoList = '';
    if (question.answers.length > 1) {
      for (int i = 0; i < question.answers.length; i++) {
        transferQuestionNumberInfoList +=
            '${i + 1}. ${question.answers[i].contentAnswer!}<br/>';
      }

      content += '<br/><br/>$transferQuestionNumberInfoList';
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: TeXView(
        renderingEngine: const TeXViewRenderingEngine.mathjax(),
        fonts: FontUtils.fonts,
        style: TeXViewStyle(
          contentColor: Colors.black,
          fontStyle: TeXViewFontStyle(
            fontSize: 16,
            fontFamily: FontFamily.nanumMyeongjo,
          ),
          padding: padding,
        ),
        loadingWidgetBuilder: (_) => const ProgressBar(),
        child: TeXViewColumn(children: [TeXViewDocument(content)]),
      ),
    );
  }
}
