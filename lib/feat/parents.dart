import 'package:flutter/material.dart';

class Parents extends StatelessWidget {
  const Parents({super.key, required this.title, this.body});

  final String title;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: body,
    );
  }
}
