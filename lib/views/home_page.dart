import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_shop/authentication/account_screen.dart';
import 'package:shoes_shop/authentication/pre_account_screen.dart';
import 'package:shoes_shop/views/cart_page.dart';
import 'package:shoes_shop/views/product_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  User? user = FirebaseAuth.instance.currentUser;

  List<Widget> get pages => [
        const ProductListPage(),
        const CartPage(),
        user != null ? const AccountScreen() : const PreAccountScreen(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        selectedItemColor: const Color.fromARGB(255, 2, 79, 52),
        unselectedItemColor: const Color.fromARGB(255, 175, 173, 173),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}
