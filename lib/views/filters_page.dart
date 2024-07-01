import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/views/brand_filter.dart';
import 'package:shoes_shop/views/color_filter.dart';
import 'package:shoes_shop/views/color_selection.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({super.key});

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {

  
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Color',
            style: TextStyle(fontSize: 15),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: const Color.fromARGB(255, 226, 222, 222)),
            ),
            child: Row(
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColorFilter(
                        backgroudColor: Color.fromARGB(255, 5, 80, 141),
                        color: 'blue'),
                    SizedBox(
                      height: 5,
                    ),
                    ColorFilter(
                        backgroudColor: Color.fromARGB(255, 255, 255, 255),
                        color: 'white'),
                    SizedBox(
                      height: 5,
                    ),
                    ColorFilter(
                        backgroudColor: Color.fromARGB(255, 0, 0, 0),
                        color: 'black')
                  ],
                ),
                const SizedBox(
                  width: 12,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColorFilter(
                        backgroudColor: Color.fromARGB(255, 188, 177, 132),
                        color: 'beige'),
                    SizedBox(
                      height: 5,
                    ),
                    ColorFilter(
                        backgroudColor: Color.fromARGB(255, 141, 138, 138),
                        color: 'grey'),
                    SizedBox(
                      height: 5,
                    ),
                    ColorFilter(
                        backgroudColor: Color.fromARGB(255, 212, 142, 195),
                        color: 'pink')
                  ],
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ColorFilter(
                        backgroudColor: Color.fromARGB(255, 7, 72, 44),
                        color: 'green'),
                    const SizedBox(
                      height: 5,
                    ),
                    const ColorFilter(
                        backgroudColor: Color.fromARGB(255, 208, 139, 20),
                        color: 'orange'),
                    const SizedBox(
                      height: 5,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: isSelected
                              ? const Color.fromARGB(255, 174, 173, 173)
                              : const Color.fromARGB(255, 233, 231, 231),
                        ),
                        onPressed: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                          final colorSelectionModel =
                              Provider.of<ColorSelectionModel>(context,
                                  listen: false);
                          if (isSelected) {
                            colorSelectionModel.addColor('multicolor');
                          } else {
                            colorSelectionModel.removeColor('multicolor');
                          }
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 20, // Adjust the size as needed
                              height: 20, // Adjust the size as needed
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blue,
                                    Colors.green,
                                    Colors.red,
                                    Colors.yellow,
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'multicolor',
                              style: TextStyle(
                                  color:
                                      isSelected ? Colors.white : Colors.black),
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
          const Text(
            'Brand',
            style: TextStyle(fontSize: 15),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: const Color.fromARGB(255, 226, 222, 222)),
            ),
            child: const Row(
              children: [
                Column(
                  children: [
                    BrandFilter(brandName: 'Jordan'),
                    SizedBox(
                      height: 5,
                    ),
                    BrandFilter(brandName: 'Nike'),
                    SizedBox(
                      height: 5,
                    ),
                    BrandFilter(brandName: 'Adidas'),
                  ],
                ),
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Show shoes')),
        ],
      ),
    );
  }
}
