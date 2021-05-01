import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/base_url.dart';

getHttp(reqType, route, data, bytes) async {
  // get token
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token') ?? '';

  if (reqType == 'post') {
    try {
      Response response = await Dio().post(
        baseURL + route,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer ' + token,
          },
          responseType: bytes ? ResponseType.bytes : ResponseType.plain,
        ),
      );
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  } else {
    try {
      Response response = await Dio().get(baseURL + route,
          options: Options(headers: {
            'Authorization': "Bearer " + token,
          }));
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
