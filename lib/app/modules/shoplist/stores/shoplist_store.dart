// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:practical_house_manager/app/modules/shoplist/models/shop_list_update.dart';
import '../models/shop_list.dart';
import '../repositories/shoplist_repository.dart';
import 'package:logging/logging.dart';

part 'shoplist_store.g.dart';

class ShopListStore = _ShopListStoreBase with _$ShopListStore;

abstract class _ShopListStoreBase with Store {
  final ShopListRepository _repository;
  final Logger _logger = Logger('ShopListStore');

  _ShopListStoreBase(this._repository) {
    fetchLists();
    _listenToRealTimeUpdates();
  }

  @observable
  ObservableList<ShopList> lists = ObservableList<ShopList>();

  @observable
  bool isLoading = false;

  @observable
  bool isWebSocketConnected = true;

  @observable
  int retryCount = 0;

  @observable
  String? fetchError;

  @action
  Future<void> fetchLists() async {
    isLoading = true;
    fetchError = null;
    try {
      final fetchedLists = await _repository.getAllLists();
      runInAction(() {
        lists.clear();
        lists.addAll(fetchedLists);
        isLoading = false;
      });
    } catch (e) {
      _logger.severe("Erro ao buscar listas: $e");
      runInAction(() {
        fetchError = e.toString();
        lists.clear();
        isLoading = false;
      });
    }
  }

  @action
  void applyUpdate(ShopListUpdate update) {
    if (update.list != null) {
      // Atualização completa ou criação de lista
      final index = lists.indexWhere((l) => l.id == update.listId);
      if (index != -1) {
        lists[index] = update.list!;
      } else {
        lists.add(update.list!);
      }
    } else {
      // Atualização em nível de item
      final index = lists.indexWhere((l) => l.id == update.listId);
      if (index != -1) {
        final updatedList = lists[index].applyUpdate(update);
        lists[index] = updatedList;
      }
    }
  }

  @action
  void dispose() {
    _repository.dispose();
  }

  void _listenToRealTimeUpdates() {
    try {
      _repository.listenToListsUpdates((update) {
        runInAction(() {
          if (update.type == "ERROR") {
            isWebSocketConnected = false;
            retryCount++;
          } else {
            applyUpdate(update);
            isWebSocketConnected = true;
            retryCount = 0;
          }
        });
      });
    } catch (e) {
      _logger.severe("Erro ao escutar atualizações: $e");
      runInAction(() {
        lists.clear();
        isWebSocketConnected = false;
      });
    }
  }
}
