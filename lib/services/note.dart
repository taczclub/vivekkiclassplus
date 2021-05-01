import 'dart:convert';
import 'dart:io';

import '../network/request.dart';

getNote(basename, path) async {
  var _error = false;
  var _msg;

  try {
    File file = File(path);
    var exists = await File(path).exists();
    if (exists) {
      file.deleteSync();
    }
    var response =
        await getHttp('post', '/notes/getnote', {'basename': basename}, false);
    try {
      var body = json.decode(response.toString());
      _error = true;
      _msg = body['msg'];
    } on FormatException catch (e) {
      var res =
          await getHttp('post', '/notes/getnote', {'basename': basename}, true);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(res.data);
      await raf.close();
    }
  } catch (e) {
    if (e.toString().isNotEmpty) {
      _error = true;
      _msg = 'Something went wrong please try again later';
    }
  }

  return {'error': _error, 'msg': _msg};
}
