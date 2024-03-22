import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:all_in_one_flutter/feat/page_view/screen/view/page_view1.dart';
import 'package:all_in_one_flutter/feat/page_view/screen/view/page_view2.dart';
import 'package:flutter/material.dart';

class BasicPageViewScreen extends StatelessWidget {
  const BasicPageViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Parents(
      title: 'Page view',
      body: PageView(
        children: const [PageView1(), PageView2()],
      ),
    );
  }
}
