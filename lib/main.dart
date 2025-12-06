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
import 'package:ovqatlar_menyusi/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // ✅ WidgetsFlutterBinding.ensureInitialized() - MAJBURIY
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Notification init
  await NotificationService().initNotification();

  // ✅ ThemeProvider yaratish
  final themeProvider = ThemeProvider();

  // ✅ Theme ni yuklash
  await themeProvider.loadTheme();

  runApp(
    ChangeNotifierProvider.value(value: themeProvider, child: const App()),
  );
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
    final themeProvider = Provider.of<ThemeProvider>(context);

    // ✅ Loading holatini tekshirish
    if (themeProvider.isLoading) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: themeProvider.isDarkMode
              ? const Color(0xFF121212)
              : Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: themeProvider.isDarkMode
                      ? Colors.blue[200]
                      : Colors.amber,
                ),
                const SizedBox(height: 20),
                Text(
                  'Mavzu yuklanmoqda...',
                  style: GoogleFonts.adventPro(
                    color: themeProvider.isDarkMode
                        ? Colors.white70
                        : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      themeMode: themeProvider.themeMode,
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
        SplashScreen.routeName: (ctx) => const SplashScreen(),
      },
    );
  }
}
