import 'package:all_in_one_flutter/core/utils/utils.dart';
import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AbsorbPointerScreen extends StatelessWidget {
  const AbsorbPointerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Parents(
      title: 'Absorb pointer',
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: TextButton(
                onPressed: () {
                  logUtil.d('button1');
                },
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('PRESS'),
              ),
            ),
          ),
          Center(
            child: AbsorbPointer(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                logUtil.d('button2');
              },
              style: TextButton.styleFrom(backgroundColor: Colors.yellow),
              child: const Text('PRESS'),
            ),
          ),
        ],
      ),
    );
  }
}
