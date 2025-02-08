import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_house_manager/app/app_module.dart';
import 'package:practical_house_manager/app/app_widget.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}


    // MultiProvider(
    // providers: [
    //   ChangeNotifierProvider(create: (context) => DarkMode()),
    //   ChangeNotifierProvider(create: (context) => Neobrutalism()),
    //   ChangeNotifierProvider(create: (context) => ColorSeed()),
    // ],