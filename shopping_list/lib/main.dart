import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/grocery_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shop',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 116, 19, 30),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 61, 35, 58),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 47, 73, 55),
      ),
      home: const GroceryList(),
    );
  }
}
