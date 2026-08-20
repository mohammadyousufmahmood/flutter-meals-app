import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/filters.dart';

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
