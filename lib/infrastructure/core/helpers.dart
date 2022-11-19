// ignore_for_file: always_declare_return_types

import 'package:shared_preferences/shared_preferences.dart';

class Helpers {
  // ignore: type_annotate_public_apis
  setUserName(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('userName', name);
  }

  Future<String?> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userName = prefs.getString("userName");

    return userName;
  }
}
