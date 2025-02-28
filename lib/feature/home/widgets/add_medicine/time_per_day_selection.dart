import 'package:flutter/material.dart';

class TimePerDaySelection extends StatelessWidget {
  final String timesPerDay;
  final ValueChanged onChanged;

  const TimePerDaySelection({
    super.key,
    required this.timesPerDay,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "How many times a Day",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 45,
          child: DropdownButtonFormField<String>(
            value: timesPerDay,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(),
            ),
            items:
                ["Once", "Twice", "Three Times"]
                    .map(
                      (time) =>
                          DropdownMenuItem(value: time, child: Text(time)),
                    )
                    .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
