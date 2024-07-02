import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/views/color_selection.dart';

class BrandFilter extends StatefulWidget {
  final String brandName;

  const BrandFilter({
    Key? key,
    required this.brandName,
  }) : super(key: key);

  @override
  _BrandFilterState createState() => _BrandFilterState();
}

class _BrandFilterState extends State<BrandFilter> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: isSelected
            ? const Color.fromARGB(255, 174, 173, 173)
            : const Color.fromARGB(255, 233, 231, 231),
      ),
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
        final colorSelectionModel =
            Provider.of<ColorSelectionModel>(context, listen: false);
        if (isSelected) {
          colorSelectionModel.addBrand(widget.brandName);
        } else {
          colorSelectionModel.removeBrand(widget.brandName);
        }
      },
      child: Text(
        widget.brandName,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }
}
