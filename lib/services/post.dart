import 'dart:convert';

import '../network/request.dart';

getPosts() async {
  try {
    var res = await getHttp('get', '/post', {}, false);
    var body = json.decode(res.toString());
    // print(body);
    if (body == null) {
      return {'error': true};
    } else {
      return body;
    }
  } catch (e) {
    return {'error': true};
  }
}
