import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/views/brand_filter.dart';
import 'package:shoes_shop/views/color_selection.dart';

void main() {
  testWidgets('BrandFilter toggles selection and updates model', (WidgetTester tester) async {
    final colorSelectionModel = ColorSelectionModel();

    await tester.pumpWidget(
      ChangeNotifierProvider<ColorSelectionModel>.value(
        value: colorSelectionModel,
        child: MaterialApp(
          home: Scaffold(
            body: BrandFilter(brandName: 'Nike'),
          ),
        ),
      ),
    );

    expect(find.text('Nike'), findsOneWidget);
    expect(colorSelectionModel.selectedBrands, isEmpty);

    await tester.tap(find.byType(TextButton));
    await tester.pumpAndSettle();

    expect(colorSelectionModel.selectedBrands, ['Nike']);

    await tester.tap(find.byType(TextButton));
    await tester.pumpAndSettle();

    expect(colorSelectionModel.selectedBrands, isEmpty);
  });
}
