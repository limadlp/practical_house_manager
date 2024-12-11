import 'package:flutter/material.dart';

class DarkMode with ChangeNotifier {
  bool darkMode = true;
  changeMode() {
    darkMode = !darkMode;
    notifyListeners();
  }
}
