import 'dart:io';

import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:all_in_one_flutter/core/utils/utils.dart';
import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_merger/pdf_merger.dart';

class EasyPDFScreen extends StatefulWidget {
  const EasyPDFScreen({super.key});

  @override
  State<EasyPDFScreen> createState() => _EasyPDFScreenState();
}

class _EasyPDFScreenState extends State<EasyPDFScreen> {
  late PDFDocument _document;
  late PageController _controller;

  bool isLoading = true;

  TransformationController transformationController =
      TransformationController();
  Offset _position = Offset.zero;
  Offset _prevPosition = Offset.zero;
  double _scale = 1.0;
  double _baseScale = 1.0;
  Offset _baseFocalPoint = Offset.zero;
  bool _isDrawing = false;

  int currentIndex = 0;

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

  Future<void> loadPDF() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
    }

    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final Directory tempDirectory = Directory('${directory.path}/midcave');
      if (await tempDirectory.exists()) {
        await tempDirectory.delete(recursive: true);
      }

      await tempDirectory.create();

      final List<String> downloadedFilePaths = await Future.wait(
        paths.map((e) async {
          final int index = paths.indexWhere((element) => element == e);
          await FlutterDownloader.enqueue(
            url: e,
            savedDir: tempDirectory.path,
            fileName: '$index.pdf',
          );

          return '${tempDirectory.path}/$index.pdf';
        }),
      );

      final String mergeFilePath = '${tempDirectory.path}/merge_pdf.pdf';
      MergeMultiplePDFResponse response = await PdfMerger.mergeMultiplePDF(
        paths: downloadedFilePaths,
        outputDirPath: mergeFilePath,
      );

      int size = File(mergeFilePath).lengthSync();
      if (size < 900) {
        logUtil.d('i am here : $size');
        response = await PdfMerger.mergeMultiplePDF(
          paths: downloadedFilePaths,
          outputDirPath: mergeFilePath,
        );
      }
      size = File(mergeFilePath).lengthSync();
      logUtil.d(size);
      logUtil.d(response.response);

      _document = await PDFDocument.fromAsset(response.response!);
      _controller = PageController(initialPage: currentIndex);

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      logUtil.e(e);
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadPDF();
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

    return Parents(
      title: 'PDF',
      floatingActionButton: IconButton(
        onPressed: () {
          ++currentIndex;
          _controller.jumpToPage(currentIndex);

          setState(() {});
        },
        icon: const Icon(Icons.plus_one),
      ),
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
                      child: Stack(
                        children: [
                          isLoading
                              ? const CircularProgressIndicator()
                              : SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height: 300,
                                  child: IgnorePointer(
                                    ignoring: true,
                                    child: PDFViewer(
                                      document: _document,
                                      controller: _controller,
                                      lazyLoad: true,
                                      showIndicator: false,
                                      showNavigation: false,
                                      showPicker: false,
                                      enableSwipeNavigation: false,
                                      minScale: 1.0,
                                      maxScale: 1.0,
                                    ),
                                  ),
                                ),
                          // 문제 번호
                          SizedBox(
                            width: 40.w,
                            child: Text(
                              '${currentIndex + 1}',
                              style: const TextStyle(fontSize: 30),
                            ),
                          ),
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