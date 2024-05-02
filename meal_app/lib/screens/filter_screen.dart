import 'package:flutter/material.dart';

enum FilterSet {
  something0,
  something1,
  something2,
  something3,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.filterState});
  final Map<FilterSet, bool> filterState;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isCheck0 = false;
  bool _isCheck1 = false;
  bool _isCheck2 = false;
  bool _isCheck3 = false;

  void _setIsCheck0(bool value) {
    setState(() {
      _isCheck0 = value;
    });
  }

  void _setIsCheck1(bool value) {
    setState(() {
      _isCheck1 = value;
    });
  }

  void _setIsCheck2(bool value) {
    setState(() {
      _isCheck2 = value;
    });
  }

  void _setIsCheck3(bool value) {
    setState(() {
      _isCheck3 = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _isCheck0 = widget.filterState[FilterSet.something0]!;
    _isCheck1 = widget.filterState[FilterSet.something1]!;
    _isCheck2 = widget.filterState[FilterSet.something2]!;
    _isCheck3 = widget.filterState[FilterSet.something3]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filter',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            FilterSet.something0: _isCheck0,
            FilterSet.something1: _isCheck1,
            FilterSet.something2: _isCheck2,
            FilterSet.something3: _isCheck3,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _isCheck0,
              onChanged: (value) {
                _setIsCheck0(value);
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              title: Text(
                'something filter 0',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'small something',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              contentPadding: const EdgeInsets.only(left: 20, right: 20),
            ),
            SwitchListTile(
              value: _isCheck1,
              onChanged: (value) {
                _setIsCheck1(value);
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              title: Text(
                'something filter 1',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'small something',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              contentPadding: const EdgeInsets.only(left: 20, right: 20),
            ),
            SwitchListTile(
              value: _isCheck2,
              onChanged: (value) {
                _setIsCheck2(value);
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              title: Text(
                'something filter 2',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'small something',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              contentPadding: const EdgeInsets.only(left: 20, right: 20),
            ),
            SwitchListTile(
              value: _isCheck3,
              onChanged: (value) {
                _setIsCheck3(value);
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              title: Text(
                'something filter 3',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'small something',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              contentPadding: const EdgeInsets.only(left: 20, right: 20),
            ),
          ],
        ),
      ),
    );
  }
}
