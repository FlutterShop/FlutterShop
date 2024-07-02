import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoes_shop/JsonModels/products.dart';
import 'package:shoes_shop/views/color_selection.dart';
import 'package:shoes_shop/views/filters_page.dart';
import 'package:shoes_shop/views/product_card.dart';
import 'package:shoes_shop/views/product_detail_page.dart';
import 'package:shoes_shop/views/product_list_page.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final _searchController = TextEditingController();
  List<Map<String, Object>> _filteredShoes = products;

  void chooseColorBrand(
      List<String> selectedColors, List<String> selectedBrands) {
    setState(() {
      _filteredShoes = products.where((product) {
        final productColors = product['colors'] as List<String>;
        final productBrand = product['company'] as String;

        final matchesColor = selectedColors.isEmpty ||
            productColors.any((color) => selectedColors.contains(color));

        final matchesBrand =
            selectedBrands.isEmpty || selectedBrands.contains(productBrand);

        return matchesColor && matchesBrand;
      }).toList();
    });
  }

  void _searchShoes() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isNotEmpty) {
        _filteredShoes = products.where((product) {
          return (product['title'] as String).toLowerCase().contains(query);
        }).toList();
      } else {
        _filteredShoes = products;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() => _searchShoes());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var selectedColors = context.watch<ColorSelectionModel>().selectedColors;
    var selectedBrands = context.watch<ColorSelectionModel>().selectedBrands;
    final screenWidth = MediaQuery.of(context).size.width;
    final textSize = screenWidth * 0.06;

    chooseColorBrand(selectedColors, selectedBrands);

    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(175, 173, 173, 0.95),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
        right: Radius.circular(50),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Shoes Shop',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 2, 79, 52),
                        fontSize: textSize),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                    onChanged: (value) => _searchShoes(),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FiltersPage()),
                    );
                  },
                  icon: const Icon(CupertinoIcons.slider_horizontal_3),
                ),
              ],
            ),
            ValueListenableBuilder(
              valueListenable: _searchController,
              builder: (context, value, child) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                    ),
                    itemCount: _filteredShoes.length,
                    itemBuilder: (context, index) {
                      final product = _filteredShoes[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return ProductDetailsPage(
                                product: product,
                              );
                            }),
                          );
                        },
                        child: ProductCard(
                          images: product['images'] as List<String>,
                          price: product['price'] as String,
                          title: product['title'] as String,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            if (selectedBrands.isNotEmpty || selectedColors.isNotEmpty)
              TextButton(
                onPressed: () {
                  context.read<ColorSelectionModel>().clearColors();
                  context.read<ColorSelectionModel>().clearBrand();
                  setState(() {
                    _filteredShoes = products;
                  });
                },
                child: const Text('Clear filters', style: TextStyle(color: Color.fromARGB(255, 2, 79, 52)),),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ColorSelectionModel>(context, listen: false)
              .toggleDarkMode();
        },
        child: Icon(Icons.brightness_4),
      ),
    );
  }
}
