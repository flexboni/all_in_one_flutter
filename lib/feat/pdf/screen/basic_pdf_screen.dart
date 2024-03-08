import 'dart:io';

import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class BasicPDFScreen extends StatefulWidget {
  const BasicPDFScreen({super.key});

  @override
  State<BasicPDFScreen> createState() => _BasicPDFScreenState();
}

class _BasicPDFScreenState extends State<BasicPDFScreen> {
  final pw.Document pdf = pw.Document();

  void loadPDF() async {
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Hello World!'),
        ),
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/example.pdf');
    await file.writeAsBytes(await pdf.save());
  }

  @override
  void initState() {
    super.initState();

    loadPDF();
  }

  @override
  Widget build(BuildContext context) {
    return Parents(
      title: 'Basic PDF',
      body: PdfPreview(
        build: (format) => pdf.save(),
      ),
    );
  }
}
