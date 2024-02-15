import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class CustomHtml extends StatelessWidget {
  const CustomHtml({super.key, this.value});

  final String? value;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: '<tex>$value</tex>',
      shrinkWrap: true,
      extensions: [
        TagExtension(
          tagsToExtend: {"tex"},
          builder: (extensionContext) {
            return Math.tex(
              extensionContext.innerHtml,
              mathStyle: MathStyle.display,
              textStyle: extensionContext.styledElement?.style.generateTextStyle(),
              onErrorFallback: (FlutterMathException e) {
                return Text(e.message);
              },
            );
          },
        ),
      ],
      style: {
        "tex": Style(
          fontFamily: 'NanumMyeongjo',
          fontSize: FontSize(20),
          color: Colors.black,
          textAlign: TextAlign.center,
        )
      },
    );
  }
}
