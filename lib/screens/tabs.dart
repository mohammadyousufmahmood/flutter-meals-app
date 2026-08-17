import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:meal_app/models/meal.dart';


class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // Getter that returns a function which filters meals by a provided predicate.
  // List<Meal> Function(bool Function(Meal)) get filteredMeals =>
  //     (bool Function(Meal) test) => dummyMeals.where(test).toList();

List<Meal> filteredMeals(bool Function(Meal) condition) 
        => dummyMeals.where(condition).toList();

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen();
    String activePageTitle = 'Categories';

    if(_selectedPageIndex == 1 ){
      activePage = MealsScreen(meals: filteredMeals((meal) => meal.isFavorite));
      activePageTitle = 'Favorites';
    }
    

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      drawer: MainDrawer(),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.category_sharp),
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.star_sharp),
            icon: Icon(Icons.star_outline),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}