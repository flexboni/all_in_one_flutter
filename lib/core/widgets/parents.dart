import 'package:flutter/material.dart';

class Parents extends StatelessWidget {
  const Parents({
    super.key,
    this.appBar,
    this.title,
    this.body,
    this.floatingActionButton,
  }) : assert(appBar != null || title != null, 'Must pass AppBar or title');

  final AppBar? appBar;
  final String? title;
  final Widget? body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ?? AppBar(title: Text(title!)),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
