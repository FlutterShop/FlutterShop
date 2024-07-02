import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/views/filters_page.dart';
import 'package:shoes_shop/views/home_page.dart';
import 'package:shoes_shop/views/color_selection.dart';

void main() {
  testWidgets('Generate FiltersPage golden file', (WidgetTester tester) async {
    print('Start FiltersPage test');
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ColorSelectionModel(),
        child: MaterialApp(
          home: const FiltersPage(),
        ),
      ),
    );
    print('Widget built');

    await expectLater(
      find.byType(FiltersPage),
      matchesGoldenFile('goldens/golden_filters_page.png'),
    );
    print('Golden file generated');
  });

  testWidgets('Generate HomePage golden file', (WidgetTester tester) async {
    print('Start HomePage test');
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ColorSelectionModel(),
        child: MaterialApp(
          home: const HomePage(),
        ),
      ),
    );
    print('Widget built');

    await expectLater(
      find.byType(HomePage),
      matchesGoldenFile('goldens/golden_home_page.png'),
    );
    print('Golden file generated');
  });
}
