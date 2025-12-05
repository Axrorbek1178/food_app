import 'package:flutter/material.dart';
import 'package:ovqatlar_menyusi/screens/meal_details_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function toggleLike;
  final Function isFavorite;
  const MealItem({
    super.key,
    required this.meal,
    required this.toggleLike,
    required this.isFavorite,
  });

  void _goToMealDetails(BuildContext context) {
    Navigator.of(
      context,
    ).pushNamed(MealDetailsScreen.routeName, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToMealDetails(context),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    child: meal.imageUrls[0].startsWith("assets/")
                        ? Image.asset(meal.imageUrls[0], fit: BoxFit.cover)
                        : Image.network(meal.imageUrls[0], fit: BoxFit.cover),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(10),
                      width: 200,
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        meal.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () => toggleLike(meal.id),
                      icon: Icon(
                        size: 20,
                        isFavorite(meal.id)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: Colors.black54,
                      ),
                    ),
                    Text("${meal.preparingTime} minutes"),
                    Text("${meal.price}\$"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
