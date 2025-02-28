import 'package:flutter/material.dart';

class FoodTimingSelection extends StatelessWidget {
  final List<String> foodTimings;
  final String intakeTime;
  final ValueChanged<String> onTimeSelected;

  const FoodTimingSelection({
    super.key,
    required this.foodTimings,
    required this.intakeTime,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            foodTimings.map((timing) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ChoiceChip(
                  label: Text(timing, style: TextStyle(color: Colors.black)),
                  selected: intakeTime == timing,
                  selectedColor: Color.fromARGB(255, 115, 134, 242),
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color:
                          intakeTime == timing
                              ? Color.fromARGB(255, 115, 134, 242)
                              : Colors.grey,
                    ),
                  ),
                  onSelected: (selected) {
                    if (selected) {
                      onTimeSelected(timing);
                    }
                  },
                  showCheckmark: false,
                ),
              );
            }).toList(),
      ),
    );
  }
}
