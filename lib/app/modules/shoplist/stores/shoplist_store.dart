import 'package:mobx/mobx.dart';
import 'package:practical_house_manager/app/modules/shoplist/models/shop_list_update.dart';
import '../models/shop_list.dart';
import '../repositories/shoplist_repository.dart';

part 'shoplist_store.g.dart';

class ShopListStore = _ShopListStoreBase with _$ShopListStore;

abstract class _ShopListStoreBase with Store {
  final ShopListRepository _repository;

  _ShopListStoreBase(this._repository) {
    fetchLists();
    _listenToRealTimeUpdates();
  }

  @observable
  ObservableList<ShopList> lists = ObservableList<ShopList>();

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchLists() async {
    isLoading = true;
    try {
      final fetchedLists = await _repository.getAllLists();
      runInAction(() {
        lists.clear();
        lists.addAll(fetchedLists);
        isLoading = false;
      });
    } catch (e) {
      print("Erro ao buscar listas: $e");
      isLoading = false;
    }
  }

  @action
  void applyUpdate(ShopListUpdate update) {
    final index = lists.indexWhere((l) => l.id == update.listId);
    if (index != -1) {
      final updatedList = lists[index].applyUpdate(update);
      lists[index] = updatedList;
    }
  }

  @action
  void dispose() {
    _repository.dispose();
  }

  void _listenToRealTimeUpdates() {
    _repository.listenToListsUpdates((update) {
      runInAction(() {
        applyUpdate(update);
      });
    });
  }
}
