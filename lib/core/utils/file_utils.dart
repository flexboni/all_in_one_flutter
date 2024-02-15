import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class FileUtils {
  const FileUtils._();

  static Future<Map<String, dynamic>> readJsonFile(String path) async {
    String file = await rootBundle.loadString(path);
    return jsonDecode(file);
  }

  static Future<String> createPath({String? endpoint}) async {
    final Directory documentDir = await getApplicationDocumentsDirectory();

    return '${documentDir.path}/${endpoint ?? 'temp'}';
  }
}
