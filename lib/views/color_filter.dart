import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/views/color_selection.dart';

class ColorFilter extends StatefulWidget {
  final Color backgroudColor;
  final String color;

  const ColorFilter({
    Key? key,
    required this.backgroudColor,
    required this.color,
  }) : super(key: key);

  @override
  _ColorFilterState createState() => _ColorFilterState();
}

class _ColorFilterState extends State<ColorFilter> {
  bool isSelected = false;


  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    final buttonSize = screenWidth * 0.26;

    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: Size.fromWidth(buttonSize),
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
          colorSelectionModel.addColor(widget.color);
        } else {
          colorSelectionModel.removeColor(widget.color);
        }
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: widget.backgroudColor,
            radius: 10,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.color,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
