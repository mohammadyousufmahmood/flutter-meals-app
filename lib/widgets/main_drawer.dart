import 'package:flutter/material.dart';
class MainDrawer extends StatelessWidget {

  const MainDrawer(this.onSelectScreen, {super.key});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 16),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant_menu,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text('Meals', style: Theme.of(context).textTheme.titleSmall?.copyWith( 
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 24),
              ),
              onTap: () {
                onSelectScreen('meal');
              },
          ),
          ListTile(
            leading: Icon(
              Icons.ramen_dining_outlined,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text('Filter', style: Theme.of(context).textTheme.titleSmall?.copyWith( 
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 24),
              ),
              onTap: () { onSelectScreen('filter');}
          )
        ],
      ),
    );
  }
}