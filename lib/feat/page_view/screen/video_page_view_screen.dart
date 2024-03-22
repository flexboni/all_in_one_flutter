import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:all_in_one_flutter/feat/page_view/screen/view/video_page_view1.dart';
import 'package:all_in_one_flutter/feat/page_view/screen/view/video_page_view2.dart';
import 'package:flutter/material.dart';

class VideoPageViewScreen extends StatelessWidget {
  const VideoPageViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Parents(
      title: 'Video page view',
      body: PageView(
        scrollDirection: Axis.vertical,
        children: const [VideoPageView1(), VideoPageView2()],
      ),
    );
  }
}
