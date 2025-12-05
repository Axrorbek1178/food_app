import 'package:flutter/material.dart';
import 'package:ovqatlar_menyusi/models/category.dart';
import 'package:ovqatlar_menyusi/models/meal.dart';
import 'package:ovqatlar_menyusi/screens/category_meals.dart';
// import 'package:ovqatlar_menyusi/screens/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final List<Meal> meals;
  const CategoryItem({super.key, required this.category, required this.meals});

  void _goToCategoryMealsScreen(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (ctx) => CategoryMealsScreen(categoruyName: category.title),
    //   ),
    // );
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {'categoryTitle': category.title, 'categoryMeals': meals},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goToCategoryMealsScreen(context),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(15),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(category.imageUrl, fit: BoxFit.cover),
            ),
            // ignore: deprecated_member_use
            Container(color: Colors.black.withOpacity(0.4)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
