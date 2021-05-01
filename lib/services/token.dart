import 'package:shared_preferences/shared_preferences.dart';

getToken() async {
  // get token
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token') ?? '';
  return token;
}
