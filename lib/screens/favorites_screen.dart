import 'package:flutter/material.dart';
import 'package:ovqatlar_menyusi/models/meal.dart';
import 'package:ovqatlar_menyusi/widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favorites;
  final Function toggleLike;
  final Function isFavorite;
  const FavoritesScreen({
    super.key,
    required this.favorites,
    required this.toggleLike,
    required this.isFavorite,
  });

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void _toggleLike(String mealId) {
    setState(() {
      widget.toggleLike(mealId);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sevimlidan o\'chirildi!'),
        duration: Duration(seconds: 1),
        action: SnackBarAction(
          label: "BEKOR QILISH",
          onPressed: () {
            setState(() {
              widget.toggleLike(mealId);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.favorites.length > 0
        ? ListView.builder(
            itemCount: widget.favorites.length,
            padding: EdgeInsets.all(10),
            itemBuilder: (ctx, index) => MealItem(
              meal: widget.favorites[index],
              toggleLike: _toggleLike,
              isFavorite: widget.isFavorite,
            ),
          )
        : const Center(child: Text("Hozircha sevimli ovqatlar mavjud emas!"));
  }
}
