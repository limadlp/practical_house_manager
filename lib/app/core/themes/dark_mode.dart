import 'package:flutter/material.dart';

class DarkMode with ChangeNotifier {
  bool darkMode = false;
  changeMode() {
    darkMode = !darkMode;
    notifyListeners();
  }
}
