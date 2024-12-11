import 'package:flutter/material.dart';
import 'package:practical_house_manager/app/core/extensions/custom_scroll_behavior.dart';
import 'package:practical_house_manager/app/core/themes/dark_mode.dart';
import 'package:practical_house_manager/app/pages/settings/settings_page.dart';
import 'package:practical_house_manager/app/pages/shell/shell_page.dart';
import 'package:practical_house_manager/app/pages/shopping_grid/shopping_grid_page.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<DarkMode>(context);
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Praction House Manager',
      //theme: themeMode.darkMode ? ThemeData.dark() : ThemeData.light(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
          brightness: themeMode.darkMode ? Brightness.dark : Brightness.light,
        ),
      ),
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      navigatorKey: GlobalKey<NavigatorState>(),
      builder: (context, state, child) {
        return ShellPage(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => NoTransitionPage(
            child: ShoppingGridPage(),
          ),
        ),
        GoRoute(
          path: '/search',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SettingsPage(),
          ),
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SettingsPage(),
          ),
        ),
      ],
    ),
  ],
);
