import 'package:flutter/material.dart';
import 'package:flutter_lab/pages/InheritedWidget/Myprovider/my_provider.dart';
import 'package:flutter_lab/pages/InheritedWidget/components/widget1.dart';
import 'package:flutter_lab/pages/InheritedWidget/components/widget2.dart';

class DemoInheritedWidget extends StatelessWidget {
  const DemoInheritedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inherited widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const W1(),
            const W2(),
            Builder(
              builder: (BuildContext context) => ElevatedButton(
                  onPressed: () => MyWrapper.of(context).state.plusOne(),
                  child: const Text('inc')),
            ),
          ],
        ),
      ),
    );
  }
}
