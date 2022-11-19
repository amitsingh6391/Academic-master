import "package:flutter/material.dart";

class AuthTabProvider extends ChangeNotifier {
  int _tab = 0;
  int get tab => _tab;

  void updateTab(int index) {
    _tab = index;
    notifyListeners();
  }
}
