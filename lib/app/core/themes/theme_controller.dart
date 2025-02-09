import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  Color colorSeed = Colors.green;
  bool darkMode = false;
  bool neobrutalism = true;

  void changeColor(Color color) {
    colorSeed = color;
    notifyListeners();
  }

  void toggleDarkMode() {
    darkMode = !darkMode;
    notifyListeners();
  }

  void toggleNeobrutalism() {
    neobrutalism = !neobrutalism;
    notifyListeners();
  }
}
