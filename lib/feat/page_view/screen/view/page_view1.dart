import 'package:all_in_one_flutter/core/utils/utils.dart';
import 'package:flutter/material.dart';

class PageView1 extends StatefulWidget {
  const PageView1({super.key});

  @override
  State<PageView1> createState() => _PageView1State();
}

class _PageView1State extends State<PageView1> {
  @override
  void initState() {
    super.initState();

    logUtil.d('page view 1 init state');
  }

  @override
  void dispose() {
    super.dispose();

    logUtil.d('page view 1 dispose');
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('page 1'));
  }
}
