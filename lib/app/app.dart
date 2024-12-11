import 'package:flutter/material.dart';
import 'package:practical_house_manager/app/core/extensions/custom_scroll_behavior.dart';
import 'package:practical_house_manager/app/core/themes/dark_mode.dart';
import 'package:practical_house_manager/app/ui/shopping_grid_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<DarkMode>(context);
    return MaterialApp(
      title: 'Praction House Manager',
      theme: themeMode.darkMode ? ThemeData.dark() : ThemeData.light(),
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: ShoppingGridPage(),
    );
  }
}
