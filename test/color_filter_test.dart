import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/views/color_filter.dart';
import 'package:shoes_shop/views/color_selection.dart';

void main() {
  testWidgets('ColorFilter toggles selection and updates model', (WidgetTester tester) async {
    final colorSelectionModel = ColorSelectionModel();

    await tester.pumpWidget(
      ChangeNotifierProvider<ColorSelectionModel>.value(
        value: colorSelectionModel,
        child: MaterialApp(
          home: Scaffold(
            body: ColorFilter(backgroudColor: Colors.blue, color: 'blue'),
          ),
        ),
      ),
    );

    expect(find.text('blue'), findsOneWidget);
    expect(colorSelectionModel.selectedColors, isEmpty);

    await tester.tap(find.byType(TextButton));
    await tester.pumpAndSettle();

    expect(colorSelectionModel.selectedColors, ['blue']);

    await tester.tap(find.byType(TextButton));
    await tester.pumpAndSettle();

    expect(colorSelectionModel.selectedColors, isEmpty);
  });
}
