import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/model/meal.dart';

final mealsProvider = Provider<List<Meal>>((ref) => dummyMeals);
