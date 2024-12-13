import 'package:flutter/material.dart';
import 'package:practical_house_manager/app/core/themes/neobrutalism.dart';
import 'package:provider/provider.dart';

class ShoppingListCard extends StatelessWidget {
  final String type;
  final List<dynamic> items;

  const ShoppingListCard({
    super.key,
    required this.type,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final isNeoBrutalism = Provider.of<Neobrutalism>(context).neobrutalism;
    if (isNeoBrutalism) {
      return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
              color: Theme.of(context).colorScheme.onSurface, width: 2),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.onSurface,
                offset: const Offset(4, 4),
                blurRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface,
                        width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.onSurface,
                        offset: const Offset(2, 2),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  child: Text(
                    type,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 8),
                ...items.map(
                  (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      '- ${item['name']}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            decoration: item['checked'] == true
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  '- ${item['name']}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        decoration: item['checked'] == true
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
