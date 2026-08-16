import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/data/dummy_data.dart';


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

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen();

    if(_selectedPageIndex == 1 ){
      activePage = MealsScreen(title: 'Favorites', meals: dummyMeals.where((meal) => meal.isFavorite).toList() ); // Replace with actual meals for the favorites
    }
    return Scaffold(
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
            activeIcon: Icon(Icons.star_rounded),
            icon: Icon(Icons.star_outline),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}