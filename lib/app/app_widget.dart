import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_house_manager/app/core/extensions/custom_scroll_behavior.dart';
import 'package:practical_house_manager/app/core/themes/theme_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Modular.get<ThemeController>();

    return AnimatedBuilder(
        animation: themeController,
        builder: (context, _) {
          return MaterialApp.router(
            routerConfig: Modular.routerConfig,
            title: 'Praction House Manager',
            //theme: themeMode.darkMode ? ThemeData.dark() : ThemeData.light(),
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: themeController.colorSeed,
                brightness: themeController.darkMode
                    ? Brightness.dark
                    : Brightness.light,
              ),
            ),
            scrollBehavior: CustomScrollBehavior(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
