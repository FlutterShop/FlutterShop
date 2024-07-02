import 'package:flutter_test/flutter_test.dart';
import 'package:shoes_shop/views/color_selection.dart';

void main() {
  group('ColorSelectionModel', () {
    test('addColor adds a color to selectedColors', () {
      final colorSelection = ColorSelectionModel();

      colorSelection.addColor('blue');

      expect(colorSelection.selectedColors, ['blue']);
    });

    test('removeColor removes a color from selectedColors', () {
      final colorSelection = ColorSelectionModel();
      colorSelection.addColor('blue');

      colorSelection.removeColor('blue');

      expect(colorSelection.selectedColors, isEmpty);
    });

    test('clearColors clears all colors from selectedColors', () {
      final colorSelection = ColorSelectionModel();
      colorSelection.addColor('blue');
      colorSelection.addColor('red');

      colorSelection.clearColors();

      expect(colorSelection.selectedColors, isEmpty);
    });

    test('addBrand adds a brand to selectedBrands', () {
      final colorSelection = ColorSelectionModel();

      colorSelection.addBrand('Nike');

      expect(colorSelection.selectedBrands, ['Nike']);
    });

    test('removeBrand removes a brand from selectedBrands', () {
      final colorSelection = ColorSelectionModel();
      colorSelection.addBrand('Nike');

      colorSelection.removeBrand('Nike');

      expect(colorSelection.selectedBrands, isEmpty);
    });

    test('clearBrands clears all brands from selectedBrands', () {
      final colorSelection = ColorSelectionModel();
      colorSelection.addBrand('Nike');
      colorSelection.addBrand('Adidas');

      colorSelection.clearBrand();

      expect(colorSelection.selectedBrands, isEmpty);
    });

    test('addSize sets the selectedSize', () {
      final colorSelection = ColorSelectionModel();

      colorSelection.addSize('10');

      expect(colorSelection.selectedSize, '10');
    });

    test('removeSize clears the selectedSize', () {
      final colorSelection = ColorSelectionModel();
      colorSelection.addSize('10');

      colorSelection.removeSize();

      expect(colorSelection.selectedSize, '');
    });
  });
}
