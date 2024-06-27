import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/views/color_selection.dart';

class SizeFilter extends StatefulWidget {
  final String size;
  
  const SizeFilter({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  State<SizeFilter> createState() => _SizeFilterState();
}

class _SizeFilterState extends State<SizeFilter> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonSize = screenWidth * 0.13;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: buttonSize * 2.3,
        height: buttonSize,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: isSelected ? const Color.fromARGB(255, 2, 79, 52) : const  Color.fromARGB(255, 226, 223, 223),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1.0),
            ),
          ),
          onPressed: () {
            setState(() {
              isSelected = !isSelected; 
              final selectedSize = Provider.of<ColorSelectionModel>(context, listen: false);
              if (isSelected) {
                selectedSize.addSize(widget.size);
              } else {
                selectedSize.removeSize();
              }
            });
            Navigator.pop(context);
          },
          child: Text(
            'US M ${widget.size}',
            style: TextStyle(
              color: Colors.black ,
              fontSize: buttonSize * 0.26,
            ),
          ),
        ),
      ),
    );
  }
}
