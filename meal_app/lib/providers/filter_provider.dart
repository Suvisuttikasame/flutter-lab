import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/providers/meal_provider.dart';

enum FilterSet {
  something0,
  something1,
  something2,
  something3,
}

class FilterNotifier extends StateNotifier<Map<FilterSet, bool>> {
  FilterNotifier()
      : super({
          FilterSet.something0: false,
          FilterSet.something1: false,
          FilterSet.something2: false,
          FilterSet.something3: false,
        });

  void setFilter(FilterSet key, bool value) {
    state = {...state, key: value};
  }
}

final filterProvider =
    StateNotifierProvider<FilterNotifier, Map<FilterSet, bool>>((ref) {
  return FilterNotifier();
});

final avialableMealProvider = Provider<List<Meal>>((ref) {
  final meals = ref.watch(mealsProvider);
  final selectedFilter = ref.watch(filterProvider);

  final avialableMeals = meals.where((meal) {
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

  return avialableMeals;
});
