import 'package:flutter/foundation.dart';

class ColorSelectionModel extends ChangeNotifier {
  List<String> selectedColors = [];
  List<String> selectedBrands = [];

  void addColor(String color) {
    selectedColors.add(color);
    notifyListeners();
  }

  void removeColor(String color) {
    selectedColors.remove(color);
    notifyListeners();
  }

  void clearColors() {
    selectedColors.clear();
    notifyListeners();
  }

  void addBrand(String brand) {
    selectedBrands.add(brand);
    notifyListeners();
  }

  void removeBrand(String brand) {
    selectedBrands.remove(brand);
    notifyListeners();
  }

  void clearBrand() {
    selectedBrands.clear();
    notifyListeners();
  }
}
