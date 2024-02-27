import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';

class PdfXScreen extends StatefulWidget {
  const PdfXScreen({super.key});

  @override
  State<PdfXScreen> createState() => _PdfXScreenState();
}

class _PdfXScreenState extends State<PdfXScreen> {
  late PdfControllerPinch _pdfController;

  TransformationController transformationController =
      TransformationController();
  Offset _position = Offset.zero;
  Offset _prevPosition = Offset.zero;
  double _scale = 1.0;
  double _baseScale = 1.0;
  Offset _baseFocalPoint = Offset.zero;
  bool _isDrawing = false;

  int currentIndex = 1;

  @override
  void initState() {
    super.initState();

    _pdfController = PdfControllerPinch(
      document: PdfDocument.openData(
        InternetFile.get(
            'https://media.seomjae.co.kr/question/content/pdf/1708662650481_t5uudltw8.pdf'),
      ),
    );
  }

  void _initScale() {
    setState(() {
      _position = Offset.zero;
      _scale = 1.0;
      _baseScale = 1.0;
      _baseFocalPoint = Offset.zero;
      _isDrawing = false;
    });
  }

  void _onScaleStart(ScaleStartDetails details) {
    _baseFocalPoint = details.focalPoint;
    _baseScale = _scale;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    final double underLimitPosition = -200 * _scale;
    final double overLimitPosition = 200 * _scale;

    if (_position.dx > underLimitPosition && _position.dx < overLimitPosition) {
      setState(() {
        if (_scale <= 3.0 && _scale >= 1.0) {
          _scale = _baseScale * details.scale;
          _position += details.focalPoint - _baseFocalPoint;
          _baseFocalPoint = details.focalPoint;
          _prevPosition = _position;
        } else if (_scale > 3.0) {
          _scale = 3.0;
        } else if (_scale < 1.0) {
          _scale = 1.0;
        }
      });
    } else if (_position.dx >= 200) {
      _position = Offset(_prevPosition.dx - 50, _prevPosition.dy);
    } else if (_position.dx <= -200) {
      _position = Offset(_prevPosition.dx + 50, _prevPosition.dy);
    }
  }

  void _onScaleEnd(ScaleEndDetails details) {
    if (_scale > 3.0) {
      _scale = 3.0;
    } else if (_scale < 1.0) {
      _scale = 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Parents(
      title: 'PDF',
      body: GestureDetector(
        onDoubleTap: _initScale,
        onScaleStart: _isDrawing ? null : _onScaleStart,
        onScaleUpdate: _isDrawing ? null : _onScaleUpdate,
        onScaleEnd: _isDrawing ? null : _onScaleEnd,
        child: Container(
          color: Colors.cyan,
          child: Transform.scale(
            scale: _scale,
            child: Transform.translate(
              offset: _position,
              child: Container(
                width: size.width,
                height: size.height,
                padding: EdgeInsets.only(
                  left: Dimens.leftPaddingOnProblem,
                  right: Dimens.rightPaddingOnProblem,
                  bottom: Dimens.bottomPadding,
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: PdfViewPinch(
                              controller: _pdfController,
                              builders:
                                  PdfViewPinchBuilders<DefaultBuilderOptions>(
                                options: const DefaultBuilderOptions(),
                                documentLoaderBuilder: (_) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                pageLoaderBuilder: (_) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              backgroundDecoration: const BoxDecoration(),
                            ),
                          ),
                          // 문제 번호
                          SizedBox(width: 40.w, child: Text('$currentIndex')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
