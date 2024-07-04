import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:tex_text/tex_text.dart';

class TexTextScreen extends StatelessWidget {
  const TexTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String value =
        r'''Fill in the blank withe the appropriate number \\n $18 \pi + 6 \pi h =$ \\n| || $\pi$''';

    return const Parents(
      title: 'Tex Text',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TexText(r'The equation is $x^2+y^2=z^2$'),
            SpaceV(),
            TexText(
              r'Fill in the blank withe the appropriate number \\n $18 \pi + 6 \pi h =$ \\n| || $\pi$',
            ),
          ],
        ),
      ),
    );
  }
}
