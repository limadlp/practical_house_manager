import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:practical_house_manager/app/core/themes/neobrutalism.dart';
import 'package:practical_house_manager/app/pages/settings/settings_page.dart';
import 'package:practical_house_manager/app/pages/shopping_grid/widgets/shopping_list_card.dart';
import 'package:provider/provider.dart';

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
      'slug': listType.toLowerCase().replaceAll(' ', '-'),
      'items': List.generate(
        itemCount,
        (i) => {'name': '$listType Item ${i + 1}', 'checked': false},
      )
    };
  });
  ShoppingGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isNeobrutalism = context.watch<Neobrutalism>().neobrutalism;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas de Compras'),
        backgroundColor: isNeobrutalism
            ? Theme.of(context).colorScheme.primaryContainer
            : null,
        elevation: isNeobrutalism ? 5 : null,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        decoration: isNeobrutalism
            ? BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHigh,
                border: Border.all(color: Colors.black, width: 2),
              )
            : null,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemCount: shoppingLists.length,
            itemBuilder: (context, index) {
              final list = shoppingLists[index];
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context)
                        .push('/list_items/${list['slug']}', extra: list);
                  },
                  child: ShoppingListCard(
                    type: list['type'],
                    items: list['items'],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: isNeobrutalism
            ? BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                border: Border.all(color: Colors.black, width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(4, 4),
                    blurRadius: 0,
                  ),
                ],
              )
            : null,
        child: FloatingActionButton(
          onPressed: () {},
          elevation: isNeobrutalism ? 0 : null,
          child: const Icon(Icons.add, color: Colors.black),
        ),
      ),
    );
  }
}
