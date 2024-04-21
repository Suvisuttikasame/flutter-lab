import 'package:flutter/material.dart';

class FixedGrid extends StatefulWidget {
  const FixedGrid({super.key, required this.items});
  final List<Widget> items;

  @override
  State<FixedGrid> createState() => _FixedGridState();
}

class _FixedGridState extends State<FixedGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        return index == 3
            ? Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    )),
              )
            : FittedBox(
                fit: BoxFit.fill,
                child: widget.items[index],
              );
      },
    );
  }
}
