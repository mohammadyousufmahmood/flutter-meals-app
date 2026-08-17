import 'package:flutter/material.dart';

import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/screens/meals.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => MealsScreen(
             title: category.title,
              meals: dummyMeals.where((meal) => meal.categories.contains(category.id)).toList(),
            ),
          ),
        );

      },
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: category.color. withValues(alpha: 0.1),
          border: Border.all(
            color: category.color,
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          category.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: category.color,
          )
        ),
      ),
    );
  }
}
