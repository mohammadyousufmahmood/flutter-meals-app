import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/filters.dart';
import 'package:meal_app/models/meal.dart';

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
    : super({
        Filter.gluttonFree: false,
        Filter.lactoseFree: false,
        Filter.vegetarian: false,
      });

  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider = StateNotifierProvider((ref) => FiltersNotifier());

final filteredMealsProvider = Provider.family<List<Meal>, String>((
  ref,
  categoryId,
) {
  final activeFilters = ref.watch(filtersProvider);

  return dummyMeals.where((meal) {
    if (!meal.categories.contains(categoryId)) return false;
    if (activeFilters[Filter.gluttonFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }

    return true;
  }).toList();
});
