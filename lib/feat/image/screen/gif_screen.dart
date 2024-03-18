import 'package:all_in_one_flutter/core/utils/utils.dart';
import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class GifScreen extends StatefulWidget {
  const GifScreen({super.key});

  @override
  State<GifScreen> createState() => _GifScreenState();
}

class _GifScreenState extends State<GifScreen>
    with SingleTickerProviderStateMixin {
  late GifController _controller;

  @override
  void initState() {
    super.initState();

    _controller = GifController(vsync: this);
    _controller.addStatusListener((status) {
      logUtil.d(status);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Parents(
      title: 'Gif',
      backgroundColor: Colors.cyan,
      body: Center(
        child: Gif(
          controller: _controller,
          autostart: Autostart.once,
          image: AssetImage(Assets.images.gif.forward10Sec.path),
        ),
      ),
    );
  }
}
