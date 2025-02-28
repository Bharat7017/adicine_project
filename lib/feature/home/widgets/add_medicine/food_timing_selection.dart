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
        children: foodTimings.map((timing) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ChoiceChip(
              label: Text(timing),
              selected: intakeTime == timing,
              onSelected: (selected) {
                if (selected) {
                  onTimeSelected(timing);
                }
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
