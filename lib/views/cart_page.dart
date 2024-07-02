import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_shop/JsonModels/shoes_data.dart';
import 'package:shoes_shop/addToCart/sqlite.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late DatabaseHelper dbHelper;
  List<ShoesData> shoesList = [];
  User? user = FirebaseAuth.instance.currentUser;
  double totalPrice = 0.0; // Change to double to support decimal prices

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();
    fetchShoes();
  }

  void fetchShoes() async {
    if (user != null) {
      List<ShoesData> shoes = await dbHelper.getShoes(user!.uid);
      setState(() {
        shoesList = shoes;
        countTotalPrice(); // Calculate total price after fetching shoes
      });
    }
  }

  void countTotalPrice() {
    totalPrice = 0.0; // Reset total price
    for (var shoe in shoesList) {
      totalPrice +=
          double.tryParse(shoe.price) ?? 0.0; // Add the price of each shoe
    }
  }

  void deleteShoe(int id) async {
    await dbHelper.deleteShoes(id);
    fetchShoes(); // Re-fetch shoes and update total price after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: shoesList.isEmpty
          ? const Center(
              child: Text('No items in the cart'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: shoesList.length,
                    itemBuilder: (context, index) {
                      ShoesData shoe = shoesList[index];
                      return Card(
                        child: ListTile(
                          leading: Image.asset(
                              shoe.imageUrl[0]), // Display the first image
                          title: Text(shoe.shoesTitle),
                          subtitle:
                              Text('Size: ${shoe.size} - \$${shoe.price}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Delete Product',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    content: const Text(
                                        'Are you sure you want to remove the product from your cart?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'No',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.of(context).pop();
                                          deleteShoe(shoe.id!);
                                        },
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Price:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 2, 79, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: () {
                    },
                    child: const Text(
                      'Buy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            ),
    );
  }
}
