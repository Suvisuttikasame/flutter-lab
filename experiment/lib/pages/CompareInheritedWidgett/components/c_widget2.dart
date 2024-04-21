import 'package:flutter/material.dart';

class CompareWidget2 extends StatefulWidget {
  const CompareWidget2({super.key, required this.count});
  final int count;

  @override
  State<CompareWidget2> createState() => _CompareWidget2State();
}

class _CompareWidget2State extends State<CompareWidget2> {
  @override
  Widget build(BuildContext context) {
    return Text('CW2 ${widget.count}');
  }
}
