import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                    SizeFilter(
                      size: '8',
                    ),
                    SizeFilter(
                      size: '8.5',
                    ),
                    SizeFilter(
                      size: '9',
                    ),
                    SizeFilter(
                      size: '9.5',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizeFilter(
                      size: '10',
                    ),
                    SizeFilter(
                      size: '10.5',
                    ),
                    SizeFilter(
                      size: '11',
                    ),
                    SizeFilter(
                      size: '11.5',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizeFilter(
                      size: '12',
                    ),
                    SizeFilter(
                      size: '12.5',
                    ),
                    SizeFilter(
                      size: '13',
                    ),
                    SizeFilter(
                      size: '13.5',
                    ),
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

    return Scaffold(
      appBar: AppBar(),
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
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: _showBottomSheet,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black),
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
                            color: Colors.black,
                            fontSize: containerSize * 0.05,
                          ),
                        ),
                        SizedBox(
                          width: containerSize * 0.45,
                        ),
                        Text(
                          'US M $selectedSize',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: containerSize * 0.05,
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price:',
                        style: TextStyle(fontSize: containerSize * 0.06),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        '${widget.product['price']} \$',
                        style: TextStyle(
                          fontSize: containerSize * 0.07,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: containerSize * 0.12,
                  ),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                      },
                      child: Text('Add to Cart', style: TextStyle(color: Colors.white, fontSize: containerSize * 0.05),),
                    ),
                  ),
                ],
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
