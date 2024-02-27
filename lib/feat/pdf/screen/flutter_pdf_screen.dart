import 'dart:async';
import 'dart:io';

import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:all_in_one_flutter/core/utils/toast_utils.dart';
import 'package:all_in_one_flutter/core/utils/utils.dart';
import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class FlutterPDFScreen extends StatefulWidget {
  const FlutterPDFScreen({super.key});

  @override
  State<FlutterPDFScreen> createState() => _FlutterPDFScreenState();
}

class _FlutterPDFScreenState extends State<FlutterPDFScreen> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();

  String remotePDFpath = "";

  TransformationController transformationController =
      TransformationController();
  Offset _position = Offset.zero;
  Offset _prevPosition = Offset.zero;
  double _scale = 1.0;
  double _baseScale = 1.0;
  Offset _baseFocalPoint = Offset.zero;
  bool _isDrawing = false;

  int currentIndex = 0;

  bool isLoading = true;

  List<String> paths = [
    "https://media.seomjae.co.kr/question/content/pdf/1708709138731_3ell82qur.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708709262787_y8qjgvjd3.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708708794177_3q1llg7nf.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708708829386_mvc34h4k1.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708708721121_ugera14xv.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708708859425_uc676hmwd.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708708890503_a4r1ha6da.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708707767384_2d9nmxx2p.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708707995787_7w8s8s7ij.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708710061672_jz5oackzp.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708709102811_k97nex7f1.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708709121155_9szle1ska.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708709174802_j2p6lbccq.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708709989809_r5xo7w682.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708709896726_uh38nqkjg.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708709348354_khbwgmu33.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708709357855_5tmkpmiil.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708709369621_taz2kfis2.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708709398229_k2b6rtsym.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708709408742_98zgmpn1g.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708709833319_iz6fe57dp.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708709462918_809fwwjli.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708709513048_ojyq8s5p1.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708709565956_si659b6b3.pdf",
    "https://media.seomjae.co.kr/question/content/pdf/1708709138731_3ell82qur.pdf",
  ];

  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    try {
      final String url = paths[currentIndex];
      final String filename = url.substring(url.lastIndexOf("/") + 1);
      final HttpClientRequest request =
          await HttpClient().getUrl(Uri.parse(url));
      final HttpClientResponse response = await request.close();
      final Uint8List bytes =
          await consolidateHttpClientResponseBytes(response);
      final Directory dir = await getApplicationDocumentsDirectory();

      File file = File("${dir.path}/$filename");
      await file.writeAsBytes(bytes, flush: true);

      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  void initState() {
    super.initState();

    createFileOfPdfUrl().then((File file) {
      setState(() {
        remotePDFpath = file.path;
      });
    });
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

    logUtil.d(remotePDFpath);

    return Parents(
      title: 'PDF',
      body: GestureDetector(
        onDoubleTap: _initScale,
        onScaleStart: _isDrawing ? null : _onScaleStart,
        onScaleUpdate: _isDrawing ? null : _onScaleUpdate,
        onScaleEnd: _isDrawing ? null : _onScaleEnd,
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
              child: remotePDFpath.isEmpty
                  ? Container()
                  : PDFView(
                      filePath: remotePDFpath,
                      enableSwipe: false,
                      defaultPage: currentIndex,
                      onRender: (int? pages) {
                        logUtil.d(pages);
                        setState(() {
                          isLoading = false;
                        });
                      },
                      onError: (error) {
                        setState(() {
                          ToastUtils.error(error.toString());
                        });
                      },
                      onPageError: (page, error) {
                        setState(() {
                          ToastUtils.error(error.toString());
                        });
                      },
                      onViewCreated: (PDFViewController pdfViewController) {
                        _controller.complete(pdfViewController);
                      },
                      onLinkHandler: (String? uri) {
                        logUtil.d('goto uri: $uri');
                      },
                      onPageChanged: (int? page, int? total) {
                        logUtil.d('page change: $page/$total');
                        if (page != null) {
                          setState(() {
                            currentIndex = page;
                          });
                        }
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
