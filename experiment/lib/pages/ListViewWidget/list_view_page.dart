import 'package:flutter/material.dart';

class MyListViewPage extends StatefulWidget {
  const MyListViewPage({super.key});

  @override
  State<MyListViewPage> createState() => _MyListViewPageState();
}

class _MyListViewPageState extends State<MyListViewPage> {
  final ScrollController _controller = ScrollController();

  final List<Widget> items = const [
    Chip(
      avatar: Icon(Icons.smoking_rooms),
      label: Text('chip'),
      padding: EdgeInsets.all(16),
    ),
    Padding(
      padding: EdgeInsets.all(24.0),
      child: Chip(avatar: Icon(Icons.smoking_rooms), label: Text('chip')),
    ),
    Chip(avatar: Icon(Icons.smoking_rooms), label: Text('chip')),
    Chip(avatar: Icon(Icons.smoking_rooms), label: Text('chip')),
    Chip(avatar: Icon(Icons.smoking_rooms), label: Text('chip')),
    Chip(avatar: Icon(Icons.smoking_rooms), label: Text('chip')),
    Chip(avatar: Icon(Icons.smoking_rooms), label: Text('chip')),
  ];

  @override
  void initState() {
    _controller.addListener(() {
      //scroll detect behavior
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        print('load more data');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: ListView.builder(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          }),
    );
  }
}
