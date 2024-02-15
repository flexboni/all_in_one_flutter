import 'package:flutter/material.dart';

class ErrorDefault extends StatelessWidget {
  const ErrorDefault({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('슈방 에러야!! $error'));
  }
}
