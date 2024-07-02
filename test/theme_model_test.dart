import 'package:flutter_test/flutter_test.dart';
import 'package:shoes_shop/main.dart';

void main() {
  group('ThemeModel', () {
    test('initial theme is light', () {
      final themeModel = ThemeModel();
      expect(themeModel.isDarkMode, false);
    });

    test('toggleDarkMode switches theme', () {
      final themeModel = ThemeModel();
      themeModel.toggleDarkMode();
      expect(themeModel.isDarkMode, true);
      themeModel.toggleDarkMode();
      expect(themeModel.isDarkMode, false);
    });
  });
}