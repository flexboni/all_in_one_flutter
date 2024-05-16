import 'dart:io';
import 'dart:typed_data';

import 'package:all_in_one_flutter/core/utils/utils.dart';
import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:all_in_one_flutter/feat/pencil/screen/app_pencil_kit.dart';
import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pencil_kit/pencil_kit.dart';
import 'package:screenshot/screenshot.dart';

class WidgetCaptureScreen extends StatefulWidget {
  const WidgetCaptureScreen({super.key});

  @override
  State<WidgetCaptureScreen> createState() => _WidgetCaptureScreenState();
}

class _WidgetCaptureScreenState extends State<WidgetCaptureScreen> {
  final ScreenshotController _imageController = ScreenshotController();

  PencilKitController? _controller;

  File? drawFile;
  File? imageFile;

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.clear();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Parents(
      title: 'Widget capture',
      body: Center(
        child: Column(
          children: [
            Screenshot(
              controller: _imageController,
              child: SizedBox(
                width: 200.w,
                height: 200.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Assets.images.capture.math.image(),
                    AppPencilKit(
                      onPencilKitViewCreated: (controller) {
                        setState(() {
                          _controller = controller;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SpaceV(size: 10),
            ElevatedButton(
              onPressed: () async {
                try {
                  final data = await _controller!.getBase64PngData();
                  final result =
                      await FileUtils.base64ToImage(data, 'tempB.png');
                  drawFile = result;
                } catch (e) {
                  logUtil.e(e);
                }

                final Uint8List? bytes = await _imageController.capture();
                if (bytes != null) {
                  final result = await FileUtils.saveUint8ListToImageFile(
                    bytes,
                    'tempA.png',
                  );

                  imageFile = result;
                }

                if (drawFile != null && imageFile != null) {
                  final result = await FileUtils.overlayImages(
                    imageFile!,
                    drawFile!,
                    'merge_file.png',
                  );

                  setState(() {
                    imageFile = result;
                  });
                }
              },
              child: const Text('PRESS'),
            ),
            const SpaceV(size: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (drawFile != null)
                  Image.file(drawFile!, width: 200.w, height: 200.w),
                const SpaceH(),
                if (imageFile != null)
                  SizedBox(
                    width: 200.w,
                    height: 200.w,
                    child: Image.file(imageFile!),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
