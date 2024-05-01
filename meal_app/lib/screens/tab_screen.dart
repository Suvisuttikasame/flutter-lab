import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/meal_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int activeIndex = 0;
  final List<Meal> favoriteMeals = [];
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

  void _toggleFavorite(Meal meal) {
    final existFavorite = favoriteMeals.contains(meal);

    if (existFavorite) {
      setState(() {
        favoriteMeals.remove(meal);
        _setSnackbar('successfully unfavor meal');
      });
    } else {
      setState(() {
        favoriteMeals.add(meal);
        _setSnackbar('successfully favor meal');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> activePage = [
      CategoriesScreen(
        toggleFavorite: _toggleFavorite,
      ),
      MealScreen(
        meals: favoriteMeals,
        toggleFavorite: _toggleFavorite,
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(activeTitle[activeIndex]),
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
