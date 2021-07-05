import 'dart:convert';

import '../network/request.dart';

getNetjrfTest(id) async {
  var _error = false;
  var _msg;

  try {
    var res =
        await getHttp('post', '/netjrftests/getnetjrftest', {'id': id}, false);
    // print(res.toString());
    var body = json.decode(res.toString());
    if (body['error'] == true) {
      _error = true;
      _msg = body['msg'];
    } else {
      _msg = body['msg'];
    }
  } catch (e) {
    if (e.toString().isNotEmpty) {
      _error = true;
      _msg = 'Something went wrong please try again later';
    }
  }

  return {'error': _error, 'msg': _msg};
}
