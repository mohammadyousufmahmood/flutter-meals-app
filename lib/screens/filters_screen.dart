import 'package:flutter/material.dart';


enum Filter {
  gluttonFree,
  lactoseFree,
  vegetarian
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.selectedFilters});

  final Map<Filter, bool> selectedFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _gluttonFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;


  @override
  void initState() {
    super.initState();
    _gluttonFreeFilterSet = widget.selectedFilters[Filter.gluttonFree] ?? false;
    _lactoseFreeFilterSet = widget.selectedFilters[Filter.lactoseFree] ?? false;
    _vegetarianFreeFilterSet = widget.selectedFilters[Filter.vegetarian] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.gluttonFree: _gluttonFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian:  _vegetarianFreeFilterSet
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluttonFreeFilterSet,
              onChanged: (isChecked) { 
                setState(() {
                  _gluttonFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Glute-Free',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'the sub title',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeThumbColor: Theme.of(context).colorScheme.onPrimaryContainer,
              contentPadding: EdgeInsets.only(left: 34, right: 22 ),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) { 
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'lactose-Free',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'the sub title',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeThumbColor: Theme.of(context).colorScheme.onPrimaryContainer,
              contentPadding: EdgeInsets.only(left: 34, right: 22 ),
            ),
            SwitchListTile(
              value: _vegetarianFreeFilterSet,
              onChanged: (isChecked) { 
                setState(() {
                  _vegetarianFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'the sub title',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeThumbColor: Theme.of(context).colorScheme.onPrimaryContainer,
              contentPadding: EdgeInsets.only(left: 34, right: 22 ),
            ),
          ],
        ),
      ),
    );
  }
}
