import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_house_manager/app/app_routes.dart';
import 'package:practical_house_manager/app/core/widgets/bottom_bar_widget.dart';
import 'package:practical_house_manager/app/modules/home/home_module.dart';
import 'package:practical_house_manager/app/modules/profile/profile_module.dart';
import 'package:practical_house_manager/app/modules/settings/settings_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    // TODO: implement binds
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const BottomBarWidget(), children: [
      ModuleRoute(AppRoutes.home, module: HomeModule()),
      ModuleRoute(AppRoutes.settings, module: SettingsModule()),
      ModuleRoute(AppRoutes.profile, module: ProfileModule()),
    ]);

    // Redireciona a rota inicial para a Home
    //r.redirect('/', to: AppRoutes.home);
  }
}
