import 'package:flutter/material.dart';

class CustomInputImage extends StatefulWidget {
  final TextEditingController imageController;
  final String label;

  const CustomInputImage({
    super.key,
    required this.imageController,
    required this.label,
  });

  @override
  State<CustomInputImage> createState() => _CustomInputImageState();
}

class _CustomInputImageState extends State<CustomInputImage> {
  var image;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .end,
      children: [
        Container(
          alignment: Alignment.center,
          width: 100,
          height: 100,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: image != null && image.isNotEmpty
              ? Image.network(image, fit: BoxFit.cover, width: 100, height: 100)
              : const Text('Rasm ki riting'),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: widget.imageController,
            decoration: InputDecoration(labelText: widget.label),
            onSubmitted: (value) {
              setState(() {
                image = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
