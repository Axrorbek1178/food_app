import 'package:flutter/material.dart';
import 'package:ovqatlar_menyusi/models/meal.dart';
import 'package:ovqatlar_menyusi/screens/add_new_product_screen.dart';
import 'package:ovqatlar_menyusi/widgets/main_drawer.dart';

class ProductsScreen extends StatefulWidget {
  final List<Meal> meals;
  final Function deleteFunction;
  const ProductsScreen({
    super.key,
    required this.meals,
    required this.deleteFunction,
  });

  static const routeName = '/products';

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  void _goToAddNewProductScreen(BuildContext context) {
    Navigator.of(context).pushNamed(AddNewProductScreen.routeName).then((
      value,
    ) {
      if (value == true) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahsulotlar'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _goToAddNewProductScreen(context),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Center(
        child: ListView.builder(
          itemCount: widget.meals.length,
          itemBuilder: (ctx, index) => Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    widget.meals[index].imageUrls[0].startsWith("assets/")
                    ? AssetImage(widget.meals[index].imageUrls[0])
                    : NetworkImage(widget.meals[index].imageUrls[0]),
              ),
              title: Text(widget.meals[index].title),
              subtitle: Text("\$${widget.meals[index].price}"),
              trailing: IconButton(
                onPressed: () => widget.deleteFunction(widget.meals[index].id),
                icon: const Icon(Icons.delete, size: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
