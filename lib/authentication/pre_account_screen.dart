import 'package:flutter/material.dart';
import 'package:shoes_shop/authentication/login_screen.dart';
import 'package:shoes_shop/authentication/signup_screen.dart';

class PreAccountScreen extends StatelessWidget {
  const PreAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            const Text(
              'Shoes Shop',
              style: TextStyle(
                  fontSize: 35, color: Color.fromARGB(255, 2, 79, 52)),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Log in or create an account',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Color.fromARGB(255, 215, 215, 215)
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)
                )
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUpScreen()));
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color:  Color.fromARGB(255, 2, 79, 52)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Already have an account?',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15,),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Color.fromARGB(255, 215, 215, 215)
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)
                )
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
              child: const Text(
                'Log In',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color:  Color.fromARGB(255, 2, 79, 52)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
