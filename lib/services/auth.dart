import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../network/request.dart';
import 'package:device_info/device_info.dart';
// import 'package:imei_plugin/imei_plugin.dart';

login(data) async {
  var _error = false;
  var _msg;

  try {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    String imei = androidInfo.androidId;
    data['imei'] = imei;
    var res = await getHttp('post', '/signin', data, false);
    var body = json.decode(res.toString());
    if (body['error'] == true) {
      _error = true;
      _msg = body['msg'];
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', body['token'].toString());
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

tryLocalLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  return token != null ? true : false;
}

logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
}
