import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/model/meal.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);

  void toggleFavorite(Meal meal) {
    final existFavorite = state.contains(meal);

    if (existFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favoriteMealProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>((ref) {
  return FavoriteMealNotifier();
});
