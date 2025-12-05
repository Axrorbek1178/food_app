import 'package:flutter/material.dart';
import 'package:ovqatlar_menyusi/models/meal.dart';
import 'package:ovqatlar_menyusi/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  final Function toggleLike;
  final Function isFavorite;
  const CategoryMealsScreen({
    super.key,
    required this.toggleLike,
    required this.isFavorite,
  });

  static const routeName = "/category-meals";

  @override
  Widget build(BuildContext context) {
    final categoryData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = categoryData['categoryTitle'];
    final meals = categoryData['categoryMeals'] as List<Meal>;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: meals.length > 0
          ? ListView.builder(
              itemCount: meals.length,
              padding: EdgeInsets.all(10),
              itemBuilder: (ctx, index) {
                return MealItem(
                  meal: meals[index],
                  toggleLike: toggleLike,
                  isFavorite: isFavorite,
                );
              },
            )
          : Center(
              child: const Text("Hozircha bu categoriyda ovqatlar mavjud emas"),
            ),
    );
  }
}
