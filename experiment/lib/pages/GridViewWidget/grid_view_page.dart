import 'package:flutter/material.dart';
import 'package:flutter_lab/pages/GridViewWidget/components/fixed_cross_grid.dart';

class MyGridViewPage extends StatefulWidget {
  const MyGridViewPage({super.key});

  @override
  State<MyGridViewPage> createState() => _MyGridViewPageState();
}

class _MyGridViewPageState extends State<MyGridViewPage> {
  final List<Widget> items = [
    Image.asset('assets/images/liverbird.jpeg'),
    Image.asset('assets/images/liverbird.jpeg'),
    Image.asset('assets/images/liverbird.jpeg'),
    Image.asset('assets/images/liverbird.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView page'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: width * 0.8, maxHeight: height * 0.7),
          child: FixedGrid(
            items: items,
          ),
        ),
      ),
    );
  }
}
