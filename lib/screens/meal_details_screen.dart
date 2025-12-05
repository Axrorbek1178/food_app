import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ovqatlar_menyusi/models/meal.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({super.key});

  static const routeName = "/meal-details";

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  int activeImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                viewportFraction: 1,
                initialPage: activeImageIndex,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeImageIndex = index;
                  });
                },
              ),
              items: meal.imageUrls.map((image) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: image.startsWith("assets/")
                      ? Image.asset(image, fit: BoxFit.cover)
                      : Image.network(image, fit: BoxFit.cover),
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: meal.imageUrls.map((image) {
                final imageindex = meal.imageUrls.indexOf(image);
                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: activeImageIndex == imageindex
                        ? Colors.black
                        : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }).toList(),
            ),
            Text("\$${meal.price}", style: TextStyle(fontSize: 20)),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ta'rifi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(meal.description),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: Card(
                margin: const EdgeInsets.all(15),
                child: ListView.separated(
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (ctx, index) {
                    return Text(meal.ingredients[index]);
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider();
                  },
                  itemCount: meal.ingredients.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
