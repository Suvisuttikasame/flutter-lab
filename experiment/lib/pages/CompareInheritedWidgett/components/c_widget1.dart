import 'package:flutter/material.dart';

class CompareWidget1 extends StatefulWidget {
  const CompareWidget1({super.key, required this.count});
  final int count;

  @override
  State<CompareWidget1> createState() => _CompareWidget1State();
}

class _CompareWidget1State extends State<CompareWidget1> {
  @override
  Widget build(BuildContext context) {
    return Text('CW1 ${widget.count}');
  }
}
