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

  List<Meal> meals = [];
  final List<String> activeTitle = ['Categories', 'Favorite'];

  void _selectTab(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  void _setSnackbar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
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
  void initState() {
    super.initState();
    meals = ref.read(mealsProvider);
  }

  @override
  Widget build(BuildContext context) {
    List<Meal> favoriteMeals = ref.watch(favoriteMealProvider);
    Map<FilterSet, bool> selectedFilter = ref.watch(filterProvider);
    List<Meal> avialableMeals = meals.where((meal) {
      if (selectedFilter[FilterSet.something0]! && !meal.isGlutenFree) {
        return false;
      } else if (selectedFilter[FilterSet.something1]! && !meal.isLactoseFree) {
        return false;
      } else if (selectedFilter[FilterSet.something2]! && !meal.isVegan) {
        return false;
      } else if (selectedFilter[FilterSet.something3]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

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
