import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.setScreen});
  final void Function(String identifier) setScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),
              Theme.of(context).colorScheme.onPrimary.withOpacity(0.9),
            ])),
            child: Row(
              children: [
                const Icon(
                  Icons.cookie,
                  size: 50,
                ),
                const SizedBox(
                  width: 24,
                ),
                Text(
                  'Cooking up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              size: 24,
              color: Colors.white,
            ),
            title: Text(
              'meal',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            onTap: () => {setScreen('meal')},
          ),
          ListTile(
            leading: const Icon(
              Icons.filter,
              size: 24,
              color: Colors.white,
            ),
            title: Text(
              'filter',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            onTap: () => {setScreen('filter')},
          ),
        ],
      ),
    );
  }
}
