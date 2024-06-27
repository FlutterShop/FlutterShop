import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> images;
  const ProductCard({
    required this.images,
    required this.price,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
// Calculate the font size based on the screen width
        final fontSize = screenWidth * 0.06;

        final imageHeight = screenHeight * 0.4;

        return Container(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                width: 1, color: const Color.fromARGB(255, 226, 222, 222)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: fontSize, // Use the calculated font size
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '\$$price',
                style: TextStyle(
                  fontSize: fontSize, // Use the calculated font size
                  color: Colors.black,
                  fontWeight: FontWeight.bold,)
              ),
              const SizedBox(height: 15),
              Center(
                child: Image.asset(
                  images[0],
                  height: imageHeight, // Use the calculated image height
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}
