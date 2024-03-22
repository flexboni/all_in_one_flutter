import 'package:all_in_one_flutter/core/utils/utils.dart';
import 'package:flutter/material.dart';

class PageView2 extends StatefulWidget {
  const PageView2({super.key});

  @override
  State<PageView2> createState() => _PageView2State();
}

class _PageView2State extends State<PageView2> {
  @override
  void initState() {
    super.initState();

    logUtil.d('page view 2 init state');
  }

  @override
  void dispose() {
    super.dispose();

    logUtil.d('page view 2 dispose');
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('page 2'));
  }
}
