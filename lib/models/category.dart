class Category {
  final String id;
  final String title;
  final String imageUrl;

  Category({required this.id, required this.title, required this.imageUrl});
}

class Categories {
  final List<Category> _list = [
    Category(
      id: "c1",
      title: "Fast Food",
      imageUrl: 'assets/images/burger.avif',
    ),
    Category(
      id: "c2",
      title: "Milliy Taomlar",
      imageUrl: 'assets/images/osh.jpeg',
    ),
    Category(
      id: "c3",
      title: "Italiya Taomlari",
      imageUrl: 'assets/images/pizza.avif',
    ),
    Category(
      id: "c4",
      title: "Fransiya Taomlari",
      imageUrl: 'assets/images/pizza.avif',
    ),
    Category(
      id: "c5",
      title: "Ichimliklar ",
      imageUrl: 'assets/images/cola.avif',
    ),
    Category(id: "c6", title: "Saladlar", imageUrl: 'assets/images/salad.avif'),
  ];

  List<Category> get list {
    return _list;
  }
}
