import 'dart:ui';

import 'package:flutter/material.dart';

class MyStyleWidget extends StatefulWidget {
  const MyStyleWidget({super.key});

  @override
  State<MyStyleWidget> createState() => _MyStyleWidgetState();
}

class _MyStyleWidgetState extends State<MyStyleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Style Practice'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Text('0' * 10000),
          Center(
            child: ClipRect(
              // <-- clips to the 200x200 [Container] below
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 200.0,
                  height: 200.0,
                  child: const Text('Hello World'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
