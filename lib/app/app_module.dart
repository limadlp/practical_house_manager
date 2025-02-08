import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_house_manager/app/app_routes.dart';
import 'package:practical_house_manager/app/core/themes/color_seed.dart';
import 'package:practical_house_manager/app/core/themes/dark_mode.dart';
import 'package:practical_house_manager/app/core/themes/neobrutalism.dart';
import 'package:practical_house_manager/app/core/widgets/bottom_bar_widget.dart';
import 'package:practical_house_manager/app/modules/home/home_module.dart';
import 'package:practical_house_manager/app/modules/profile/profile_module.dart';
import 'package:practical_house_manager/app/modules/settings/settings_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<DarkMode>(DarkMode.new);
    i.addSingleton<Neobrutalism>(Neobrutalism.new);
    i.addSingleton<ColorSeed>(ColorSeed.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const BottomBarWidget(), children: [
      ModuleRoute(
        AppRoutes.home,
        module: HomeModule(),
        transition: TransitionType.noTransition,
      ),
      ModuleRoute(
        AppRoutes.settings,
        module: SettingsModule(),
        transition: TransitionType.noTransition,
      ),
      ModuleRoute(
        AppRoutes.profile,
        module: ProfileModule(),
        transition: TransitionType.noTransition,
      ),
    ]);
  }
}
