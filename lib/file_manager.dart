import 'dart:io';

import 'package:background_locator_example/database_handler.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class FileManager {
  static Future<void> writeToLogFile(String log) async {
    final file = await _getTempLogFile();
    await file.writeAsString(log, mode: FileMode.append);
  }

  static Future<String> readLogFile() async {
    final file = await _getTempLogFile();
    return file.readAsString();
  }

  static Future<File> _getTempLogFile() async {
//    final directory = await pathProvider.getTemporaryDirectory();

//    final directory = await pathProvider.getDownloadsDirectory();
//    final file = File('${directory.path}/log.txt');
    final file = File('/data/user/0/com.example.background_locator_example/cache/log.txt');
    if (!await file.exists()) {
      await file.writeAsString('');
    }
    return file;
  }

  static Future<void> clearLogFile() async {
    final file = await _getTempLogFile();
    await file.writeAsString('');
  }
}
