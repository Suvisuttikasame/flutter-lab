import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> items = [];
  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(builder: (ctx) => const NewItem()),
    );
    if (newItem == null) {
      return;
    }
    setState(
      () {
        items.add(newItem);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(items[index].id),
        onDismissed: (direction) {
          setState(() {
            items.removeAt(index);
          });
        },
        child: ListTile(
          leading: Container(
            width: 24,
            height: 24,
            color: items[index].category.color,
          ),
          title: Text(items[index].name),
          trailing: Text(
            items[index].quantity.toString(),
          ),
        ),
      ),
    );

    if (items.isEmpty) {
      content = const Center(
        child: Text('No item\'s selected'),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping list'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
