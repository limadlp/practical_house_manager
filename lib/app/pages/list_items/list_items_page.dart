import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Items'),
      ),
      body: ListView.builder(
        itemCount: widget.list['items'].length,
        itemBuilder: (context, index) {
          return Card(
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
                  decoration: widget.list['items'][index]['checked'] == true
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    widget.list['items'].removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
