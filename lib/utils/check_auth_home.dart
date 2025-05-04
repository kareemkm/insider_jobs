import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveIsLogin(bool? isLogin) async {

  SharedPreferences prefs = await SharedPreferences.getInstance() ;

  await prefs.setBool('is_login', isLogin ?? false);
}


Future<bool?> getIsLogin() async {

  SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getBool('is_login');
}