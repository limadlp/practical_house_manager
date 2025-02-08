import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_house_manager/app/core/extensions/custom_scroll_behavior.dart';
import 'package:practical_house_manager/app/core/themes/color_seed.dart';
import 'package:practical_house_manager/app/core/themes/dark_mode.dart';
import 'package:practical_house_manager/app/modules/settings/settings_page.dart';
import 'package:practical_house_manager/app/pages/list_items/list_items_page.dart';
import 'package:practical_house_manager/app/pages/shell/shell_page.dart';
import 'package:practical_house_manager/app/pages/shopping_grid/shopping_grid_page.dart';
import 'package:go_router/go_router.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = Modular.get<DarkMode>();
    final colorProvider = Modular.get<ColorSeed>();
    return AnimatedBuilder(
        animation: themeMode,
        builder: (context, _) {
          return MaterialApp.router(
            routerConfig: Modular.routerConfig,
            title: 'Praction House Manager',
            //theme: themeMode.darkMode ? ThemeData.dark() : ThemeData.light(),
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: colorProvider.colorSeed,
                brightness:
                    themeMode.darkMode ? Brightness.dark : Brightness.light,
              ),
            ),
            scrollBehavior: CustomScrollBehavior(),
            debugShowCheckedModeBanner: false,
          );
        });
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
          path: '/list_items/:slug',
          pageBuilder: (context, state) {
            final slug = state.pathParameters['slug']!;
            final list = state.extra as Map<String, dynamic>;

            return NoTransitionPage(
              child: ListItemsPage(
                slug: slug,
                list: list,
              ),
            );
          },
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
