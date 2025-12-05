import 'package:flutter/material.dart';
import 'package:ovqatlar_menyusi/models/category.dart';
import 'package:ovqatlar_menyusi/models/meal.dart';
import 'package:ovqatlar_menyusi/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> categories;
  final List<Meal> meals;
  const CategoriesScreen({
    super.key,
    required this.categories,
    required this.meals,
  });

  @override
  Widget build(BuildContext context) {
    return categories.length > 0
        ? GridView(
            padding: EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: categories.map((category) {
              final categoryMeals = meals
                  .where((meal) => meal.categoryId == category.id)
                  .toList();
              return CategoryItem(category: category, meals: categoryMeals);
            }).toList(),
          )
        : const Center(child: Text("Ovqat kategoriyalari mavjud emas!"));
  }
}
