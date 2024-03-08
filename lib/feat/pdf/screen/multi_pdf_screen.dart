import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';

class MultiPDFScreen extends StatefulWidget {
  const MultiPDFScreen({super.key});

  @override
  State<MultiPDFScreen> createState() => _MultiPDFScreenState();
}

class _MultiPDFScreenState extends State<MultiPDFScreen>
    with TickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Parents(
      title: 'Multi PDF',
      body: GridView.builder(
        itemCount: paths.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (_, index) {
          return AppPDFView(url: paths[index]);
        },
      ),
    );
  }
}

class AppPDFView extends StatefulWidget {
  const AppPDFView({super.key, required this.url});

  final String url;

  @override
  State<AppPDFView> createState() => _AppPDFViewState();
}

class _AppPDFViewState extends State<AppPDFView> {
  late PdfControllerPinch _pdfController;

  @override
  void initState() {
    super.initState();

    _pdfController = PdfControllerPinch(
      document: PdfDocument.openData(InternetFile.get(widget.url)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 400,
      child: IgnorePointer(
        ignoring: true,
        child: PdfViewPinch(
          controller: _pdfController,
          builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
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
    );
  }
}
