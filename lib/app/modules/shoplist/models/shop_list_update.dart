import 'package:practical_house_manager/app/modules/shoplist/models/shop_item.dart';

class ShopListUpdate {
  final String type; // "CREATE", "UPDATE", "DELETE"
  final String listId;
  final String? itemId;
  final ShopItem? item;

  ShopListUpdate({
    required this.type,
    required this.listId,
    this.itemId,
    this.item,
  });

  factory ShopListUpdate.fromJson(Map<String, dynamic> json) {
    return ShopListUpdate(
      type: json['type'],
      listId: json['listId'],
      itemId: json['itemId'],
      item: json['item'] != null ? ShopItem.fromJson(json['item']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'listId': listId,
      'itemId': itemId,
      'item': item?.toJson(),
    };
  }

  factory ShopListUpdate.error() {
    return ShopListUpdate(
      type: 'ERROR',
      listId: '',
      itemId: null,
      item: null,
    );
  }
}
