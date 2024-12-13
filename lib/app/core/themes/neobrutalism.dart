import 'package:flutter/material.dart';

class Neobrutalism with ChangeNotifier {
  bool neobrutalism = true;
  changeMode() {
    neobrutalism = !neobrutalism;
    notifyListeners();
  }
}
