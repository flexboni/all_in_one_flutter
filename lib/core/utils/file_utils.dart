import 'dart:convert';
import 'dart:io';

import 'package:all_in_one_flutter/core/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class FileUtils {
  const FileUtils._();

  static Future<Map<String, dynamic>> readJsonFile(String path) async {
    String file = await rootBundle.loadString(path);
    return jsonDecode(file);
  }

  static Future<String> createDocumentPath({String? endpoint}) async {
    final Directory documentDir = await getApplicationDocumentsDirectory();

    return '${documentDir.path}/${endpoint ?? 'temp'}';
  }

  static Future<String?> createPath({String? endpoint}) async {
    Directory? directory = Platform.isIOS
        ? await getDownloadsDirectory()
        : await getExternalStorageDirectory();
    if (directory != null) {
      return '${directory.path}/${endpoint ?? 'temp'}';
    }

    return null;
  }

  static Future<File> saveUint8ListToImageFile(
    Uint8List uint8List,
    String fileName,
  ) async {
    // 앱의 문서 디렉토리를 가져옵니다.
    final directory = await getApplicationDocumentsDirectory();

    // 파일의 전체 경로를 생성합니다.
    final filePath = '${directory.path}/$fileName';

    // Uint8List 데이터를 파일로 씁니다.
    final file = File(filePath);
    await file.writeAsBytes(uint8List);

    return file;
  }

  static Future<File> base64ToImage(
      String base64String, String fileName) async {
    // Decode the Base64 string to bytes
    Uint8List imageBytes = base64Decode(base64String);

    // Get the directory to save the image
    Directory tempDir = await getTemporaryDirectory();
    String filePath = '${tempDir.path}/$fileName';

    // Write the bytes to a file
    File file = File(filePath);
    await file.writeAsBytes(imageBytes);

    return file;
  }

  static Future<File?> overlayImages(
    File file1,
    File file2,
    String outputFileName,
  ) async {
    img.Image? image1 = img.decodeImage(file1.readAsBytesSync());
    img.Image? image2 = img.decodeImage(file2.readAsBytesSync());

    if (image1 == null || image2 == null) {
      return null;
    }

    try {
      img.compositeImage(image1, image2);

      // Get the directory to save the image
      Directory tempDir = await getTemporaryDirectory();

      // Save the resulting image
      File outputFile =
          File('${tempDir.path}/$outputFileName${DateTime.now()}');
      outputFile.writeAsBytesSync(img.encodePng(image1));

      return outputFile;
    } catch (e) {
      logUtil.e(e);
      return null;
    }
  }
}
