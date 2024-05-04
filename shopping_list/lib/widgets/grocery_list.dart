import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> items = [];
  bool _isloading = true;
  String _error = '';

  void _fetchItem() async {
    try {
      final url = Uri.https(
        dotenv.env['FIREASE_HOST']!,
        'shopping_list.json',
      );
      final res = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (res.body == 'null') {
        setState(() {
          _isloading = false;
        });
        return;
      }
      final Map<String, dynamic> itemList = jsonDecode(res.body);
      final List<GroceryItem> tempItems = [];

      for (final item in itemList.entries) {
        final category = categories.entries
            .firstWhere((cat) => cat.value.label == item.value['category'])
            .value;
        tempItems.add(
          GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category,
          ),
        );
      }
      setState(() {
        items = tempItems;
        _isloading = false;
        _error = '';
      });
    } catch (e) {
      setState(() {
        _isloading = false;
        _error = e.toString();
      });
    }
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(builder: (ctx) => const NewItem()),
    );
    if (newItem == null) {
      return;
    }
    setState(() {
      items.add(newItem);
    });
  }

  void _deleteItem(item, index) async {
    try {
      setState(() {
        items.removeAt(index);
      });
      final url = Uri.https(
        dotenv.env['FIREASE_HOST']!,
        'shopping_list/${item.id}.json',
      );
      http.delete(url);
    } catch (e) {
      items.insert(index, item);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchItem();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(items[index].id),
        onDismissed: (direction) {
          _deleteItem(items[index], index);
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

    if (_isloading) {
      return const Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_error != '') {
      content = Center(
        child: Text(_error),
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
