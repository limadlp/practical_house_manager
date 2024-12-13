import 'package:flutter/material.dart';

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
