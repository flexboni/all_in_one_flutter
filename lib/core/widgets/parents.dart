import 'package:flutter/material.dart';

class Parents extends StatelessWidget {
  const Parents({super.key, this.appBar, this.title, this.body})
      : assert(appBar != null || title != null, 'Must pass AppBar or title');

  final AppBar? appBar;
  final String? title;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ?? AppBar(title: Text(title!)),
      body: body,
    );
  }
}
