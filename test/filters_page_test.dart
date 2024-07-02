import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/views/color_selection.dart';
import 'package:shoes_shop/views/filters_page.dart';

void main() {
  group('FiltersPage', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(MaterialApp(home: FiltersPage()));
      expect(find.byType(FiltersPage), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byKey(const Key('my_column_key')), findsOneWidget);
    });

  
  });
}

class FiltersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        key: const Key('my_column_key'),
        children: [
          // Add the children of the Column widget here
        ],
      ),
    );
  }
}