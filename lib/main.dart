import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shoes_shop/views/color_selection.dart';
import 'package:shoes_shop/views/home_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ColorSelectionModel()),
      ],
      child: Consumer<ColorSelectionModel>(
        builder: (context, themeModel, child) {
          return MaterialApp(
            theme: themeModel.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

