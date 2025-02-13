class ShopItem {
  final String id;
  final String item;
  final String user;
  final bool checked;
  final DateTime created;

  ShopItem({
    required this.id,
    required this.item,
    required this.user,
    required this.checked,
    required this.created,
  });

  factory ShopItem.fromJson(Map<String, dynamic> json) {
    return ShopItem(
      id: json['id'] ?? '',
      item: json['item'] ?? '',
      user: json['user'] ?? '',
      checked: json['checked'] ?? false,
      created: DateTime.tryParse(json['created'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'item': item,
      'user': user,
      'checked': checked,
      'created': created.toIso8601String(),
    };
  }
}
