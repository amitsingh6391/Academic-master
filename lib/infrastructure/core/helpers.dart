import 'package:shared_preferences/shared_preferences.dart';

class Helpers {
  Future<void> setUserName(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('userName', name);
  }

  Future<String?> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userName = prefs.getString("userName");

    return userName;
  }
}
