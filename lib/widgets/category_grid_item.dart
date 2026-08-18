import 'package:flutter/material.dart';

import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meals.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.filters,
  });

  final Category category;
  final Map<Filter, bool> filters;

  List<Meal> get filteredMeals{

    return dummyMeals.where((meal) {

      if(!meal.categories.contains(category.id)) return false;
      if(filters[Filter.gluttonFree]! && !meal.isGlutenFree) return false;
      if(filters[Filter.lactoseFree]! && !meal.isLactoseFree) return false;
      if(filters[Filter.vegetarian]! && !meal.isVegetarian) return false;

      return true;
    }).toList();

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: category.color.withValues(alpha: 0.1),
          border: Border.all(color: category.color, width: 0.8),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          category.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: category.color,
          ),
        ),
      ),
    );
  }
}
