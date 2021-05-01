import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<File> getPdfPath(url) async {
  Completer<File> completer = Completer();
  // print('Start download file from internet!');

  try {
    var data = await http.get(url);
    var bytes = data.bodyBytes;
    var dir = await getApplicationDocumentsDirectory();
    // print('Download files');
    File file = File('${dir.path}/mypdf.pdf');
    File urlFile = await file.writeAsBytes(bytes);
    completer.complete(urlFile);
  } catch (e) {
    throw Exception('Error parsing asset file!');
  }
  return completer.future;
}
