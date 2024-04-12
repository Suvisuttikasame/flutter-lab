import 'package:flutter/material.dart';
import 'package:flutter_lab/pages/InheritedWidget/Myprovider/my_provider.dart';

class W2 extends StatelessWidget {
  const W2({super.key});

  @override
  Widget build(BuildContext context) {
    final int c = MyWrapper.of(context).state.count;
    return Text('W2 $c');
  }
}
