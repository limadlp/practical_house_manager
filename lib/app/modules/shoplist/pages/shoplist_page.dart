import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_house_manager/app/modules/shoplist/pages/widgets/shop_list_card.dart';
import 'package:practical_house_manager/app/modules/shoplist/stores/shoplist_store.dart';

import '../models/shop_list.dart';

class ShoplistPage extends StatefulWidget {
  const ShoplistPage({super.key});

  @override
  State<ShoplistPage> createState() => _ShoplistPageState();
}

class _ShoplistPageState extends State<ShoplistPage> {
  final ShopListStore store = Modular.get<ShopListStore>();

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  Widget _buildConnectionErrorBanner() {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const Icon(Icons.warning, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Conexão perdida",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Tentando reconectar... (${store.retryCount})",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Listas de Compras")),
      body: RefreshIndicator(
        onRefresh: () => store.fetchLists(),
        child: Observer(
          builder: (_) {
            if (store.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (store.fetchError != null) {
              return Center(
                  child: Text("Erro ao carregar: ${store.fetchError}"));
            }

            return Stack(
              children: [
                // Conteúdo principal
                if (store.lists.isEmpty)
                  const Center(child: Text("Nenhuma lista disponível"))
                else
                  ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: store.lists.length,
                    itemBuilder: (context, index) {
                      final ShopList list = store.lists[index];
                      return KeyedSubtree(
                        key: ValueKey(list.id),
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          child: ShoplistCard(list: list),
                        ),
                      );
                    },
                  ),

                // Banner de erro de conexão
                if (!store.isWebSocketConnected)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: _buildConnectionErrorBanner(),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// class ShoplistCard extends StatelessWidget {
//   final ShopList list;

//   const ShoplistCard({required this.list});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         title: Text(list.name),
//         subtitle: Text("${list.items.length} itens"),
//         onTap: () {
//           // Navegar para detalhes da lista
//         },
//       ),
//     );
//   }
// }

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
