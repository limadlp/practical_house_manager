import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_house_manager/app/modules/settings/settings_page.dart';

class SettingsModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const SettingsPage());
  }
}
