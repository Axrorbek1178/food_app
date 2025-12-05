import 'package:flutter/material.dart';
import 'package:ovqatlar_menyusi/models/category.dart';
import 'package:ovqatlar_menyusi/models/meal.dart';
import 'package:ovqatlar_menyusi/screens/categories_screen.dart';
import 'package:ovqatlar_menyusi/screens/favorites_screen.dart';
import 'package:ovqatlar_menyusi/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Category> categories;
  final Meals mealModel;
  final Function toggleLike;
  final Function isFavorite;
  const TabsScreen({
    super.key,
    required this.categories,
    required this.mealModel,
    required this.toggleLike,
    required this.isFavorite,
  });

  static const routeName = '/';
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _tabIndex = 0;

  List<Map<String, dynamic>> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': CategoriesScreen(
          categories: widget.categories,
          meals: widget.mealModel.list,
        ),
        'title': 'Ovqatlar Menyusi',
      },
      {
        'page': FavoritesScreen(
          favorites: widget.mealModel.favorites,
          toggleLike: widget.toggleLike,
          isFavorite: widget.isFavorite,
        ),
        'title': 'Sevimli Ovqatlar',
      },
    ];
  }

  void _changeTab(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_tabIndex]['title'])),
      drawer: const MainDrawer(),
      body: _pages[_tabIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: _tabIndex,
        onTap: _changeTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "Barchasi",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Sevimli"),
        ],
      ),
    );
  }
}
