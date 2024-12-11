import 'package:flutter/material.dart';
import 'package:practical_house_manager/app/app.dart';
import 'package:practical_house_manager/app/core/themes/dark_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => DarkMode(),
    child: const App(),
  ));
}
