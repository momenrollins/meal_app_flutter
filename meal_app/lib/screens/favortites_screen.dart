import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavoritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty)
      return Center(
        child: Text("You have no favourites yet!"),
      );
    else
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(favouriteMeals[index]);
        },
        itemCount: favouriteMeals.length,
      );
  }
}
