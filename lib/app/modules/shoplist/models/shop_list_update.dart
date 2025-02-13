import 'package:practical_house_manager/app/modules/shoplist/models/shop_item.dart';
import 'package:practical_house_manager/app/modules/shoplist/models/shop_list.dart';

class ShopListUpdate {
  final String
      type; // "LIST_CREATE", "LIST", "CREATE", "UPDATE", "DELETE", "ERROR"
  final String listId;
  final String? itemId;
  final ShopItem? item;
  final ShopList? list;

  ShopListUpdate({
    required this.type,
    required this.listId,
    this.itemId,
    this.item,
    this.list,
  });

  factory ShopListUpdate.fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String;
    final listId = json['listId'] as String;
    final itemId = json['itemId'] as String?;
    if (json.containsKey('list') && json['list'] != null) {
      final list = ShopList.fromJson(json['list']);
      return ShopListUpdate(
        type: type,
        listId: listId,
        list: list,
        itemId: itemId,
      );
    } else if (json.containsKey('item') && json['item'] != null) {
      final item = ShopItem.fromJson(json['item']);
      return ShopListUpdate(
        type: type,
        listId: listId,
        itemId: itemId,
        item: item,
      );
    } else {
      return ShopListUpdate(
        type: type,
        listId: listId,
        itemId: itemId,
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'type': type,
      'listId': listId,
      'itemId': itemId,
    };
    if (list != null) {
      data['list'] = list!.toJson();
    }
    if (item != null) {
      data['item'] = item!.toJson();
    }
    return data;
  }

  factory ShopListUpdate.error() {
    return ShopListUpdate(
      type: 'ERROR',
      listId: '',
    );
  }
}
