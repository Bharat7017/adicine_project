import 'package:flutter/material.dart';

class ColorAddMedicine extends StatelessWidget {
  final List<Color> colors;
  final Color selectedColor;
  final Function(Color) onColorSelected;

  const ColorAddMedicine({
    super.key,
    required this.colors,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            colors.map((color) {
              return GestureDetector(
                onTap: () => onColorSelected(color),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            selectedColor == color
                                ? Colors.blue
                                : Colors.transparent,
                        width: 1,
                      ),
                    ),
                    child: CircleAvatar(backgroundColor: color, radius: 25),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
