class Meal {
  final String id;
  final String title;
  final List<String> imageUrls;
  final String description;
  final List<String> ingredients;
  final int preparingTime;
  final double price;
  final String categoryId;

  Meal({
    required this.id,
    required this.title,
    required this.imageUrls,
    required this.description,
    required this.ingredients,
    required this.preparingTime,
    required this.price,
    required this.categoryId,
  });
}

class Meals {
  final List<Meal> _list = [
    Meal(
      id: 'm1',
      title: "Lavash",
      imageUrls: [
        'assets/images/lavash.webp',
        'assets/images/lavash1.jpeg',
        'assets/images/lavash2.jpeg',
        'assets/images/lavash3.jpeg',
      ],
      description: "Ajoyib Lavash",
      ingredients: ["go'sht", "pomidor", "bodring"],
      preparingTime: 10,
      price: 12,
      categoryId: 'c1',
    ),
    Meal(
      id: 'm2',
      title: "Burger",
      imageUrls: [
        "assets/images/burger.avif",
        'assets/images/burger1.avif',
        'assets/images/burger2.avif',
        'assets/images/burger3.avif',
      ],
      description: "Ajoyib Burger",
      ingredients: ["go'sht", "pomidor", "bodring"],
      preparingTime: 15,
      price: 15,
      categoryId: 'c1',
    ),
    Meal(
      id: 'm3',
      title: "Osh ",
      imageUrls: [
        "assets/images/osh.jpeg",
        "assets/images/osh1.jpeg",
        "assets/images/osh2.jpeg",
        "assets/images/osh3.jpeg",
      ],
      description: "Ajoyib Osh",
      ingredients: ["go'sht", "pomidor", "bodring"],
      preparingTime: 10,
      price: 20,
      categoryId: 'c2',
    ),
    Meal(
      id: 'm4',
      title: "Somsa",
      imageUrls: [
        "assets/images/somsa2.jpeg",
        "assets/images/somsa3.jpeg",
        "assets/images/somsa.jpeg",
        "assets/images/somsa1.jpeg",
      ],
      description: "Ajoyib Somsa",
      ingredients: ["go'sht", "pomidor", "bodring"],
      preparingTime: 15,
      price: 5,
      categoryId: 'c2',
    ),
    Meal(
      id: 'm5',
      title: "Pizza",
      imageUrls: [
        "assets/images/pizza.avif",
        "assets/images/pizza1.jpeg",
        "assets/images/pizza2.jpeg",
        "assets/images/pizza3.jpeg",
      ],
      description: "Ajoyib Pizza",
      ingredients: ["go'sht", "pomidor", "bodring"],
      preparingTime: 15,
      price: 15,
      categoryId: 'c3',
    ),
    Meal(
      id: 'm6',
      title: "Coca Cola",
      imageUrls: [
        "assets/images/cola.avif",
        "assets/images/cola1.avif",
        "assets/images/cola2.avif",
        "assets/images/cola3.avif",
      ],
      description: "Ajoyib Coca Cola",
      ingredients: [],
      preparingTime: 1,
      price: 1,
      categoryId: 'c5',
    ),
    Meal(
      id: 'm7',
      title: "Mountain Dew",
      imageUrls: [
        "assets/images/mDew.jpg",
        "assets/images/mDew1.jpeg",
        "assets/images/mDew2.jpeg",
        "assets/images/mDew3.jpeg",
      ],
      description: "Ajoyib Mountain Dew",
      ingredients: [],
      preparingTime: 1,
      price: 1,
      categoryId: 'c5',
    ),
    Meal(
      id: 'm8',
      title: "Cesar",
      imageUrls: [
        "assets/images/salad.avif",
        "assets/images/salad1.jpeg",
        "assets/images/salad2.jpeg",
        "assets/images/salad3.jpeg",
      ],
      description: "Ajoyib Cesar Salad",
      ingredients: [
        "tovuq go'sht",
        "pomidor,"
            "bodring",
      ],
      preparingTime: 10,
      price: 5,
      categoryId: 'c6',
    ),
  ];

  final List<Meal> _favorites = [];

  List<Meal> get list {
    return _list;
  }

  List<Meal> get favorites {
    return _favorites;
  }

  void toggleLike(String mealId) {
    final mealIndex = _favorites.indexWhere((meal) => meal.id == mealId);
    if (mealIndex < 0) {
      _favorites.add(list.firstWhere((meal) => meal.id == mealId));
    } else {
      _favorites.removeWhere((meal) => meal.id == mealId);
    }
  }

  void addNewMeal(Meal meal) {
    _list.add(meal);
  }

  void removeMeal(String mealId) {
    _list.removeWhere((meal) => meal.id == mealId);
  }
}
