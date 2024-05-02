import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/providers/favorite_meal_provider.dart';
import 'package:meal_app/providers/filter_provider.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int activeIndex = 0;
  final List<String> activeTitle = ['Categories', 'Favorite'];

  void _selectTab(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filter') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => const FilterScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Meal> favoriteMeals = ref.watch(favoriteMealProvider);
    List<Meal> avialableMeals = ref.watch(avialableMealProvider);
    final List<Widget> activePage = [
      CategoriesScreen(
        avialableMeals: avialableMeals,
      ),
      MealScreen(
        meals: favoriteMeals,
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(activeTitle[activeIndex]),
      ),
      drawer: MainDrawer(
        setScreen: _setScreen,
      ),
      body: activePage[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectTab(index);
        },
        currentIndex: activeIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
