import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shoes_shop/JsonModels/shoes_data.dart';
import 'package:shoes_shop/addToCart/sqlite.dart';
import 'package:shoes_shop/authentication/pre_account_screen.dart';
import 'package:shoes_shop/views/cart_page.dart';
import 'package:shoes_shop/views/color_selection.dart';
import 'package:shoes_shop/views/home_page.dart';
import 'package:shoes_shop/views/size_filter.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  User? user = FirebaseAuth.instance.currentUser;
  final db = DatabaseHelper();

  void addShoes(String selectedSize) {
    if (selectedSize.isNotEmpty && user != null) {
      db.addShoes(ShoesData(
          userId: user!.uid, 
          shoesId: widget.product['id'] as String,
          shoesTitle: widget.product['title'] as String,
          price: widget.product['price'] as String,
          size: selectedSize,
          imageUrl: widget.product['images'] as List<String>));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product added successfully!'),
        ),
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a size!'),
        ),
      );
    }
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: const Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizeFilter(size: '8'),
                    SizeFilter(size: '8.5'),
                    SizeFilter(size: '9'),
                    SizeFilter(size: '9.5'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizeFilter(size: '10'),
                    SizeFilter(size: '10.5'),
                    SizeFilter(size: '11'),
                    SizeFilter(size: '11.5'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizeFilter(size: '12'),
                    SizeFilter(size: '12.5'),
                    SizeFilter(size: '13'),
                    SizeFilter(size: '13.5'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.product['images'] as List<String>;
    final screenWidth = MediaQuery.of(context).size.width;
    final containerSize = screenWidth * 0.9;
    final selectedSize = context.watch<ColorSelectionModel>().selectedSize;
    final theme = context.watch<ColorSelectionModel>().isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['title'] as String),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product['title'] as String,
                style: TextStyle(
                  fontSize: containerSize * 0.09,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: _showBottomSheet,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: theme ? Colors.white : Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: SizedBox(
                  width: containerSize * 0.9,
                  height: 60,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Size',
                          style: TextStyle(
                            color: theme ? Colors.white : Colors.black,
                            fontSize: containerSize * 0.05,
                          ),
                        ),
                        SizedBox(width: containerSize * 0.45),
                        Text(
                          'US M $selectedSize',
                          style: TextStyle(
                            color: theme ? Colors.white : Colors.black,
                            fontSize: containerSize * 0.05,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: theme ? Colors.white : Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: containerSize,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: containerSize,
                      margin: const EdgeInsets.all(1),
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(images[index]),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price:',
                        style: TextStyle(fontSize: containerSize * 0.06),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '${widget.product['price']} \$',
                        style: TextStyle(
                          fontSize: containerSize * 0.07,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: containerSize * 0.12),
                  SizedBox(
                    width: containerSize * 0.7,
                    height: containerSize * 0.15,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 2, 79, 52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onPressed: () {
                        if (user == null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PreAccountScreen()));
                        } else {
                          addShoes(selectedSize);
                        }
                      },
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: containerSize * 0.05,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Description:",
                style: TextStyle(fontSize: containerSize * 0.06),
              ),
              const SizedBox(height: 10),
              Text(
                '${widget.product['info']}',
                style: TextStyle(fontSize: containerSize * 0.045),
              )
            ],
          ),
        ),
      ),
    );
  }
}
