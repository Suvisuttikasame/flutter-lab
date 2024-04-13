import 'package:flutter/material.dart';
import 'package:flutter_lab/pages/CompareInheritedWidgett/components/c_widget1.dart';
import 'package:flutter_lab/pages/CompareInheritedWidgett/components/c_widget2.dart';

class CompareInheritedWidgetPage extends StatefulWidget {
  const CompareInheritedWidgetPage({super.key});

  @override
  State<CompareInheritedWidgetPage> createState() =>
      _CompareInheritedWidgetPageState();
}

class _CompareInheritedWidgetPageState
    extends State<CompareInheritedWidgetPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compare inheerited widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CompareWidget1(count: count),
            CompareWidget2(count: count),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: const Text('inc'),
            )
          ],
        ),
      ),
    );
  }
}
