import 'package:practical_house_manager/app/modules/shoplist/models/shop_list_update.dart';

import '../models/shop_list.dart';

abstract class ShopListRepository {
  Future<List<ShopList>> getAllLists();
  Future<ShopList> getListById(String listId);
  Future<void> addItemToList(String listId, Map<String, dynamic> item);
  Future<void> updateItemInList(
      String listId, String itemId, Map<String, dynamic> item);
  Future<void> deleteItemFromList(String listId, String itemId);
  void listenToListsUpdates(Function(ShopListUpdate) onUpdate);
  void dispose();
}
