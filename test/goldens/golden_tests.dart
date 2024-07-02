import 'package:flutter_test/flutter_test.dart';
import 'package:shoes_shop/views/filters_page.dart';
import 'package:shoes_shop/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/views/color_selection.dart';

void main() {
  testWidgets('FiltersPage golden test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ColorSelectionModel(),
        child: MaterialApp(
          home: const FiltersPage(),
        ),
      ),
    );

    await expectLater(
      find.byType(FiltersPage),
      matchesGoldenFile('golden_filters_page.png'),
    );
  });

  testWidgets('HomePage golden test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ColorSelectionModel(),
        child: MaterialApp(
          home: const HomePage(),
        ),
      ),
    );

    await expectLater(
      find.byType(HomePage),
      matchesGoldenFile('golden_home_page.png'),
    );
  });
}
