import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/filters.dart';
import 'package:meal_app/providers/filters_provider.dart';
import 'package:meal_app/screens/meals.dart';

class CategoryGridItem extends ConsumerWidget {
  const CategoryGridItem({super.key, required this.category});

  final Category category;

  // List<Meal> get filteredMeals{

  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredMeals = ref.watch(filteredMealsProvider(category.id));
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
