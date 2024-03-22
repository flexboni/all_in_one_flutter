import 'package:flutter/material.dart';

class Parents extends StatelessWidget {
  const Parents({
    super.key,
    this.appBar,
    this.title,
    this.body,
    this.backgroundColor,
    this.floatingActionButton,
  }) : assert(appBar != null || title != null, 'Must pass AppBar or title');

  final AppBar? appBar;
  final String? title;
  final Widget? body;
  final Color? backgroundColor;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ?? AppBar(title: Text(title!)),
      body: body,
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
    );
  }
}
