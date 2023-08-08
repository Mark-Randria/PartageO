import 'package:shared_preferences/shared_preferences.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

Future setToken(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('token', value);
}

Future getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

void deleteToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
}

dynamic decodeToken(token) {
  final jwt = JWT.decode(token);
  return jwt.payload;
}