import 'package:flutter/material.dart';
import 'package:practical_house_manager/app/modules/shoplist/models/shop_item.dart';
import 'package:practical_house_manager/app/modules/shoplist/models/shop_list.dart';

class ShoplistCard extends StatelessWidget {
  final ShopList list;
  const ShoplistCard({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              list.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...list.items.map((item) => _buildItemTile(item)),
          ],
        ),
      ),
    );
  }

  Widget _buildItemTile(ShopItem item) {
    return Row(
      children: [
        Checkbox(
          value: item.checked,
          onChanged: null,
        ),
        Expanded(
          child: Text(
            item.item,
            style: TextStyle(
              fontSize: 16,
              decoration: item.checked ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
      ],
    );
  }
}
