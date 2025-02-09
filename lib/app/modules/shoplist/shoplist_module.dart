import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_house_manager/app/modules/shoplist/pages/shoplist_page.dart';
import 'package:practical_house_manager/app/modules/shoplist/repositories/shoplist_repository.dart';
import 'package:practical_house_manager/app/modules/shoplist/repositories/shoplist_repository_impl.dart';
import 'package:practical_house_manager/app/modules/shoplist/stores/shoplist_store.dart';

class ShoplistModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<ShopListRepository>(() => ShopListRepositoryImpl());
    i.addLazySingleton(() => ShopListStore(i.get<ShopListRepository>()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => ShoplistPage());
  }
}
