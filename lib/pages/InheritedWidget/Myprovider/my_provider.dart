//MyWrapper widget that inherit InheritedWidget
import 'package:flutter/material.dart';

class MyWrapper extends InheritedWidget {
  const MyWrapper({super.key, required this.state, required super.child});

  final MyProviderState state;

  static MyWrapper of(BuildContext context) {
    final state = context.dependOnInheritedWidgetOfExactType<MyWrapper>();
    assert(state != null, 'No state found');
    return state!;
  }

  @override
  bool updateShouldNotify(covariant MyWrapper oldWidget) {
    return true;
  }
}

//MyProvider will be child of Mywrapper
class MyProvider extends StatefulWidget {
  const MyProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<MyProvider> createState() => MyProviderState();
}

class MyProviderState extends State<MyProvider> {
  //this is where state is stored for any widgets read&write
  int _count = 0;

  int get count => _count;

  void plusOne() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyWrapper(
      state: this,
      child: widget.child,
    );
  }
}
