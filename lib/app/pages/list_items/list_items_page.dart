import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_house_manager/app/core/themes/neobrutalism.dart';

class ListItemsPage extends StatefulWidget {
  final String slug;
  final Map<String, dynamic> list;

  const ListItemsPage({super.key, required this.list, required this.slug});

  @override
  State<ListItemsPage> createState() => _ListItemsPageState();
}

class _ListItemsPageState extends State<ListItemsPage> {
  @override
  Widget build(BuildContext context) {
    final isNeobrutalism = context.watch<Neobrutalism>().neobrutalism;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Items'),
      ),
      body: ListView.builder(
        itemCount: widget.list['items'].length,
        itemBuilder: (context, index) {
          return isNeobrutalism
              ? NeobrutalistListItem(
                  item: widget.list['items'][index],
                  onCheckChanged: (bool? value) {
                    setState(() {
                      widget.list['items'][index]['checked'] = value;
                    });
                  },
                  onDelete: () {
                    setState(() {
                      widget.list['items'].removeAt(index);
                    });
                  },
                )
              : Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: Checkbox(
                        value: widget.list['items'][index]['checked'] ?? false,
                        onChanged: (bool? value) {
                          setState(() {
                            widget.list['items'][index]['checked'] = value;
                          });
                        },
                      ),
                      title: Text(
                        widget.list['items'][index]['name'],
                        style: TextStyle(
                          decoration:
                              widget.list['items'][index]['checked'] == true
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete_outline,
                          color: theme.colorScheme.error,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.list['items'].removeAt(index);
                          });
                        },
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}

class NeobrutalistListItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final Function(bool?) onCheckChanged;
  final VoidCallback onDelete;

  const NeobrutalistListItem({
    super.key,
    required this.item,
    required this.onCheckChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        elevation: 8,
        color: theme.colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: theme.colorScheme.primary, width: 3),
        ),
        child: Transform.translate(
          offset: const Offset(4, 4),
          child: ListTile(
            leading: Checkbox(
              value: item['checked'] ?? false,
              onChanged: onCheckChanged,
              side: BorderSide(color: theme.colorScheme.primary, width: 2),
            ),
            title: Text(
              item['name'],
              style: TextStyle(
                decoration: item['checked'] == true
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete_outline,
                color: theme.colorScheme.error,
                size: 28,
              ),
              onPressed: onDelete,
            ),
          ),
        ),
      ),
    );
  }
}
