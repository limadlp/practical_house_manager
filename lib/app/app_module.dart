import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_house_manager/app/app_routes.dart';
import 'package:practical_house_manager/app/core/themes/theme_controller.dart';
import 'package:practical_house_manager/app/core/widgets/bottom_bar_widget.dart';
import 'package:practical_house_manager/app/modules/profile/profile_module.dart';
import 'package:practical_house_manager/app/modules/settings/settings_module.dart';
import 'package:practical_house_manager/app/modules/shoplist/shoplist_module.dart';
import 'package:practical_house_manager/app/pages/list_items/list_items_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<ThemeController>(ThemeController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const BottomBarWidget(), children: [
      ModuleRoute(
        AppRoutes.shoplist,
        module: ShoplistModule(),
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
    r.child(
      '/list_items/:slug', // 🔥 Definição da rota dinâmica
      child: (context) {
        final slug = Modular.args.params['slug']!; // 🔥 Obtendo o slug
        final list = Modular.args.data
            as Map<String, dynamic>?; // 🔥 Pegando os dados extras

        return ListItemsPage(
          slug: slug,
          list: list ?? {}, // Se `list` for nulo, passa um mapa vazio
        );
      },
      customTransition: CustomTransition(
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return child; // 🔥 Sem animação
        },
      ),
    );
  }
}
