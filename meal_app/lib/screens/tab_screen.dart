import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int activeIndex = 0;
  Map<FilterSet, bool> selectedFilter = {
    FilterSet.something0: false,
    FilterSet.something1: false,
    FilterSet.something2: false,
    FilterSet.something3: false,
  };
  final List<Meal> favoriteMeals = [];
  List<Meal> avialableMeals = [];
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

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filter') {
      final result = await Navigator.of(context).push<Map<FilterSet, bool>>(
        MaterialPageRoute(
            builder: (ctx) => FilterScreen(
                  filterState: selectedFilter,
                )),
      );
      setState(() {
        selectedFilter = result!;
        avialableMeals = dummyMeals.where((meal) {
          if (selectedFilter[FilterSet.something0]! && !meal.isGlutenFree) {
            return false;
          } else if (selectedFilter[FilterSet.something1]! &&
              !meal.isLactoseFree) {
            return false;
          } else if (selectedFilter[FilterSet.something2]! && !meal.isVegan) {
            return false;
          } else if (selectedFilter[FilterSet.something3]! &&
              !meal.isVegetarian) {
            return false;
          }
          return true;
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> activePage = [
      CategoriesScreen(
        toggleFavorite: _toggleFavorite,
        avialableMeals: avialableMeals,
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
