import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:practical_house_manager/app/core/themes/theme_controller.dart';
import 'package:practical_house_manager/app/modules/settings/settings_page.dart';
import 'package:practical_house_manager/app/modules/shoplist/models/shop_item.dart';
import 'package:practical_house_manager/app/modules/shoplist/stores/shoplist_store.dart';
import 'package:practical_house_manager/app/pages/shopping_grid/widgets/shopping_list_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/shoplist_store.dart';
import '../models/shop_list.dart';

class ShoplistPage extends StatefulWidget {
  @override
  _ShoplistPageState createState() => _ShoplistPageState();
}

class _ShoplistPageState extends State<ShoplistPage> {
  final ShopListStore store = Modular.get<ShopListStore>();

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listas de Compras")),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (store.lists.isEmpty) {
            return Center(child: Text("Nenhuma lista disponível"));
          }

          return ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: store.lists.length,
            itemBuilder: (context, index) {
              final ShopList list = store.lists[index];
              return KeyedSubtree(
                key: ValueKey(list.id),
                child: AnimatedSize(
                  duration: Duration(milliseconds: 300),
                  child: _buildShopListCard(list),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildShopListCard(ShopList list) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              list.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ...list.items.map((item) => _buildItemTile(item)).toList(),
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

/*
class ShoplistPage extends StatelessWidget {
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
  ShoplistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isNeobrutalism = context.watch<ThemeController>().neobrutalism;

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
                    Modular.to.pushNamed('/list_items/${list['slug']}',
                        arguments: list);
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
*/
