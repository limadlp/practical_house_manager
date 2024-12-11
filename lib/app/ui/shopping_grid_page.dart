import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:practical_house_manager/app/ui/shopping_list_card.dart';

class ShoppingGridPage extends StatelessWidget {
  final List<Map<String, dynamic>> shoppingLists = List.generate(10, (index) {
    final types = [
      'Supermercado',
      'Farmácia',
      'Livraria',
      'Eletrônicos',
      'Roupas'
    ];
    final random = Random();
    final listType = types[random.nextInt(types.length)];
    final itemCount = random.nextInt(10) + 3;

    return {
      'type': listType,
      'items': List.generate(itemCount, (i) => '$listType Item ${i + 1}')
    };
  });

  ShoppingGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas de Compras'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          itemCount: shoppingLists.length,
          itemBuilder: (context, index) {
            final list = shoppingLists[index];
            return ShoppingListCard(
              type: list['type'],
              items: list['items'],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
