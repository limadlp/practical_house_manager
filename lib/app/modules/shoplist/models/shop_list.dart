import 'package:practical_house_manager/app/modules/shoplist/models/shop_list_update.dart';

import 'shop_item.dart';

class ShopList {
  final String id;
  final String name;
  final DateTime created;
  final List<ShopItem> items;

  ShopList({
    required this.id,
    required this.name,
    required this.created,
    required this.items,
  });

  factory ShopList.fromJson(Map<String, dynamic> json) {
    return ShopList(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      created: DateTime.tryParse(json['created'] ?? '') ?? DateTime.now(),
      items: (json['items'] as List<dynamic>?)
              ?.map((item) => ShopItem.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created': created.toIso8601String(),
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  ShopList copyWith({
    String? id,
    String? name,
    DateTime? created,
    List<ShopItem>? items,
  }) {
    return ShopList(
      id: id ?? this.id,
      name: name ?? this.name,
      created: created ?? this.created,
      items: items ?? this.items,
    );
  }

  // Aplica uma atualização à lista
  ShopList applyUpdate(ShopListUpdate update) {
    switch (update.type) {
      case 'CREATE':
        // Adiciona um novo item à lista
        return copyWith(
          items: [...items, update.item!],
        );

      case 'UPDATE':
        // Atualiza um item existente
        return copyWith(
          items: items.map((item) {
            return item.id == update.itemId ? update.item! : item;
          }).toList(),
        );

      case 'DELETE':
        // Remove um item da lista
        return copyWith(
          items: items.where((item) => item.id != update.itemId).toList(),
        );

      default:
        // Retorna a lista sem alterações se o tipo de atualização for desconhecido
        return this;
    }
  }
}
