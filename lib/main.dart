import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_house_manager/app/app_module.dart';
import 'package:practical_house_manager/app/app_widget.dart';
import 'package:practical_house_manager/app/core/themes/color_seed.dart';
import 'package:practical_house_manager/app/core/themes/dark_mode.dart';
import 'package:practical_house_manager/app/core/themes/neobrutalism.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DarkMode()),
        ChangeNotifierProvider(create: (context) => Neobrutalism()),
        ChangeNotifierProvider(create: (context) => ColorSeed()),
      ],
      child: ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    ),
  );
}


    // MultiProvider(
    // providers: [
    //   ChangeNotifierProvider(create: (context) => DarkMode()),
    //   ChangeNotifierProvider(create: (context) => Neobrutalism()),
    //   ChangeNotifierProvider(create: (context) => ColorSeed()),
    // ],