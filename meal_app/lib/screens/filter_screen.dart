import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterProvider);
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
        canPop: true,
        child: Column(
          children: [
            SwitchListTile(
              value: filterState[FilterSet.something0]!,
              onChanged: (value) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(FilterSet.something0, value);
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
              value: filterState[FilterSet.something1]!,
              onChanged: (value) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(FilterSet.something1, value);
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
              value: filterState[FilterSet.something2]!,
              onChanged: (value) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(FilterSet.something2, value);
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
              value: filterState[FilterSet.something3]!,
              onChanged: (value) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(FilterSet.something3, value);
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
