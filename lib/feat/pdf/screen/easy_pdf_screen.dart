import 'dart:io';

import 'package:all_in_one_flutter/core/utils/utils.dart';
import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_file/internet_file.dart';
import 'package:path_provider/path_provider.dart';

class EasyPDFScreen extends StatefulWidget {
  const EasyPDFScreen({super.key});

  @override
  State<EasyPDFScreen> createState() => _EasyPDFScreenState();
}

class _EasyPDFScreenState extends State<EasyPDFScreen>
    with TickerProviderStateMixin {
  late PDFDocument _document;
  late PageController _controller;
  late TabController _tabController;

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
      appBar: AppBar(
        title: const Text('PDF'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '1'),
            Tab(text: '2'),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          ++currentIndex;
          _controller.jumpToPage(currentIndex);

          setState(() {});
        },
        icon: const Icon(Icons.plus_one),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [FirstScreen(), SecondScreen()],
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late PDFDocument _document;
  late PageController _controller;

  bool isLoading = true;

  TransformationController transformationController =
      TransformationController();

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
      final Directory tempDirectory = Directory('${directory.path}/midcave/1');
      if (await tempDirectory.exists()) {
        await tempDirectory.delete(recursive: true);
      }

      await tempDirectory.create();

      List<String> filePaths = [];
      for (var i = 0; i < paths.length; i++) {
        final Uint8List pdfData = await InternetFile.get(paths[i]);
        final String path = '${tempDirectory.path}/$i.pdf';
        File file = File(path);
        await file.writeAsBytes(pdfData);

        filePaths.add(path);
      }

      final String mergeFilePath = '${tempDirectory.path}/merge_pdf.pdf';
      // MergeMultiplePDFResponse response = await PdfMerger.mergeMultiplePDF(
      //   paths: filePaths,
      //   outputDirPath: mergeFilePath,
      // );

      // _document = await PDFDocument.fromAsset(response.response!);
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Stack(
        children: [
          SizedBox(
            child: Stack(
              children: [
                isLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
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
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late PDFDocument _document;
  late PageController _controller;

  bool isLoading = true;

  TransformationController transformationController =
      TransformationController();

  int currentIndex = 0;

  List<String> paths = [
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
  ];

  Future<void> loadPDF() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
    }

    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final Directory tempDirectory = Directory('${directory.path}/midcave/2');
      if (await tempDirectory.exists()) {
        await tempDirectory.delete(recursive: true);
      }

      await tempDirectory.create();

      List<String> filePaths = [];
      for (var i = 0; i < paths.length; i++) {
        final Uint8List pdfData = await InternetFile.get(paths[i]);
        final String path = '${tempDirectory.path}/$i.pdf';
        File file = File(path);
        await file.writeAsBytes(pdfData);

        filePaths.add(path);
      }

      final String mergeFilePath = '${tempDirectory.path}/merge_pdf.pdf';
      // MergeMultiplePDFResponse response = await PdfMerger.mergeMultiplePDF(
      //   paths: filePaths,
      //   outputDirPath: mergeFilePath,
      // );

      // _document = await PDFDocument.fromAsset(response.response!);
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Stack(
        children: [
          SizedBox(
            child: Stack(
              children: [
                isLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
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
    );
  }
}
