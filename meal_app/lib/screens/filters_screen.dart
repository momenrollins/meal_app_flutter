import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/fltr";
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['glutenFree'];
    _lactoseFree = widget.currentFilters['lactoseFree'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitchListTile(String title, bool value, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text("Only include ${title.toLowerCase()} meals."),
      value: value,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final Map<String, bool> selectedFilters = {
                  "glutenFree": _glutenFree,
                  "lactoseFree": _lactoseFree,
                  "vegan": _vegan,
                  "vegetarian": _vegetarian
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile("Gluten-Free", _glutenFree, (val) {
                setState(() {
                  _glutenFree = val;
                });
              }),
              buildSwitchListTile("Lactose-Free", _lactoseFree, (val) {
                setState(() {
                  _lactoseFree = val;
                });
              }),
              buildSwitchListTile("Vegan", _vegan, (val) {
                setState(() {
                  _vegan = val;
                });
              }),
              buildSwitchListTile("Vegetarian", _vegetarian, (val) {
                setState(() {
                  _vegetarian = val;
                });
              }),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
