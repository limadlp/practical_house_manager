import 'package:flutter/material.dart';

class ColorSeed extends ChangeNotifier {
  Color colorSeed = Colors.green;
  changeColor(Color color) {
    colorSeed = color;
    notifyListeners();
  }
}
