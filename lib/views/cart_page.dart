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
      });
    }
  }

  void deleteShoe(int id) async {
    await dbHelper.deleteShoes(id);
    fetchShoes();
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
          : ListView.builder(
              itemCount: shoesList.length,
              itemBuilder: (context, index) {
                ShoesData shoe = shoesList[index];
                return Card(
                  child: ListTile(
                    leading: Image.asset(
                        shoe.imageUrl[0]), // Display the first image
                    title: Text(shoe.shoesTitle),
                    subtitle: Text('Size: ${shoe.size} - \$${shoe.price}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        deleteShoe(shoe.id!);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
