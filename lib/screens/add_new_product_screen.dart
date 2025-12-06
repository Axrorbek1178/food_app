import 'package:flutter/material.dart';
import 'package:ovqatlar_menyusi/models/category.dart';
import 'package:ovqatlar_menyusi/models/meal.dart';
import 'package:ovqatlar_menyusi/service/notification_service.dart';
import 'package:ovqatlar_menyusi/widgets/custom_input_image.dart';

class AddNewProductScreen extends StatefulWidget {
  final List<Category> categories;
  final Function addFunction;

  const AddNewProductScreen({
    super.key,
    required this.categories,
    required this.addFunction,
  });

  static const routeName = '/add-new-product';

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  late String categoryId;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _preparationTimeController =
      TextEditingController();
  final TextEditingController _mainImageController = TextEditingController();
  final TextEditingController _image1Controller = TextEditingController();
  final TextEditingController _image2Controller = TextEditingController();
  final TextEditingController _image3Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    categoryId = widget.categories[0].id;
  }

  void _save() {
    final title = _titleController.text;
    final description = _descriptionController.text;
    final ingredients = _ingredientsController.text;
    final price = _priceController.text;
    final preparationTime = _preparationTimeController.text;
    final mainImageUrl = _mainImageController.text;
    final image1Url = _image1Controller.text;
    final image2Url = _image2Controller.text;
    final image3Url = _image3Controller.text;

    if (title.isEmpty ||
        description.isEmpty ||
        price.isEmpty ||
        preparationTime.isEmpty ||
        mainImageUrl.isEmpty ||
        ingredients.isEmpty ||
        image1Url.isEmpty ||
        image2Url.isEmpty ||
        image3Url.isEmpty) {
      return;
    }
    final List<String> ingredientsList = ingredients.split(',');
    final List<String> imageUrls = [
      mainImageUrl,
      image1Url,
      image2Url,
      image3Url,
    ];
    widget.addFunction(
      Meal(
        id: UniqueKey().toString(),
        title: title,
        description: description,
        ingredients: ingredientsList,
        price: double.parse(price),
        preparingTime: int.parse(preparationTime),
        imageUrls: imageUrls,
        categoryId: categoryId,
      ),
    );
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yangi Ovqat'),
        actions: [
          IconButton(
            onPressed: () {
              _save();
              NotificationService().showNotification(
                title: 'Yangi ovqat qo\'shildi',
                body: 'Siz yangi ovqatni muvaffaqiyatli qo\'shdingiz!',
              );
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              DropdownButton(
                isExpanded: true,
                value: categoryId,
                onChanged: (id) {
                  setState(() {
                    categoryId = id as String;
                  });
                },
                items: widget.categories
                    .map(
                      (category) => DropdownMenuItem(
                        value: category.id,
                        child: Text(category.title),
                      ),
                    )
                    .toList(),
              ),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Ovqat nomi'),
              ),
              TextField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: const InputDecoration(labelText: 'Ovqat ta\'rifi'),
              ),
              TextField(
                controller: _ingredientsController,
                decoration: const InputDecoration(
                  labelText: 'Ovqat Tarkibi(Misol: go\'sht, sabzi, piyoz...)',
                ),
              ),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Narxi'),
              ),
              TextField(
                controller: _preparationTimeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Tayyorlanish vaqti (minutda)',
                ),
              ),
              const SizedBox(height: 10),
              CustomInputImage(
                imageController: _mainImageController,
                label: 'Asosiy rasm linkini kiriting',
              ),
              const SizedBox(height: 10),

              CustomInputImage(
                imageController: _image1Controller,
                label: 'Rasm 1 linkini kiriting',
              ),
              const SizedBox(height: 10),

              CustomInputImage(
                imageController: _image2Controller,
                label: 'Rasm 2 linkini kiriting',
              ),
              const SizedBox(height: 10),

              CustomInputImage(
                imageController: _image3Controller,
                label: 'Rasm 3 linkini kiriting',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
