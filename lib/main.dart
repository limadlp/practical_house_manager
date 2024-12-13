import 'package:flutter/material.dart';
import 'package:practical_house_manager/app/app.dart';
import 'package:practical_house_manager/app/core/themes/color_seed.dart';
import 'package:practical_house_manager/app/core/themes/dark_mode.dart';
import 'package:practical_house_manager/app/core/themes/neobrutalism.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => DarkMode()),
      ChangeNotifierProvider(create: (context) => Neobrutalism()),
      ChangeNotifierProvider(create: (context) => ColorSeed()),
    ],
    child: const App(),
  ));
}
