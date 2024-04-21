import 'package:flutter/material.dart';
import 'package:flutter_lab/pages/InheritedWidget/Myprovider/my_provider.dart';

class W1 extends StatelessWidget {
  const W1({super.key});

  @override
  Widget build(BuildContext context) {
    final int c = MyWrapper.of(context).state.count;
    return Text('W1 $c');
  }
}
