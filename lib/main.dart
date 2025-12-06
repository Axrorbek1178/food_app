import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ovqatlar_menyusi/models/category.dart';
import 'package:ovqatlar_menyusi/models/meal.dart';
import 'package:ovqatlar_menyusi/screens/add_new_product_screen.dart';
import 'package:ovqatlar_menyusi/screens/category_meals.dart';
import 'package:ovqatlar_menyusi/screens/meal_details_screen.dart';
import 'package:ovqatlar_menyusi/screens/products_screen.dart';
import 'package:ovqatlar_menyusi/screens/splash_screen.dart';
import 'package:ovqatlar_menyusi/screens/tabs_screen.dart';
import 'package:ovqatlar_menyusi/service/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init notification
  NotificationService().initNotification();

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _categoryModel = Categories();

  final _mealModel = Meals();

  void _toggleLike(String mealId) {
    setState(() {
      _mealModel.toggleLike(mealId);
    });
  }

  bool _isFavorite(String mealId) {
    return _mealModel.favorites.any((meal) => meal.id == mealId);
  }

  void _addNewMeal(Meal meal) {
    setState(() {
      _mealModel.addNewMeal(meal);
    });
  }

  void _removeMeal(String mealId) {
    setState(() {
      _mealModel.removeMeal(mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.adventPro().fontFamily,
        useMaterial3: false,
      ),

      // home: CategoriesScreen(
      //   categories: _categoryModel.list,
      //   meals: _mealModel.list,
      // ),
      // initialRoute: TabsScreen.routeName,
      initialRoute: SplashScreen.routeName,
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(
          categories: _categoryModel.list,
          mealModel: _mealModel,
          toggleLike: _toggleLike,
          isFavorite: _isFavorite,
        ),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
          toggleLike: _toggleLike,
          isFavorite: _isFavorite,
        ),
        MealDetailsScreen.routeName: (ctx) => const MealDetailsScreen(),
        ProductsScreen.routeName: (ctx) =>
            ProductsScreen(meals: _mealModel.list, deleteFunction: _removeMeal),
        AddNewProductScreen.routeName: (ctx) => AddNewProductScreen(
          categories: _categoryModel.list,
          addFunction: _addNewMeal,
        ),
        SplashScreen.routeName: (ctx) => SplashScreen(),
      },
    );
  }
}
