import 'package:flutter/material.dart';
import 'package:practical_house_manager/app/core/extensions/custom_scroll_behavior.dart';
import 'package:practical_house_manager/app/ui/shopping_grid_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masonry Grid - Shopping Lists',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      scrollBehavior: CustomScrollBehavior(),
      home: ShoppingGridPage(),
    );
  }
}
