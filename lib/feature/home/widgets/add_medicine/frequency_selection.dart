import 'package:flutter/material.dart';

class FrequencySelection extends StatelessWidget {
  final String frequency;
  final ValueChanged onChanged;

  const FrequencySelection({
    super.key,
    required this.frequency,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Frequency of Days",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 45,
          child: DropdownButtonFormField<String>(
            value: frequency,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(),
            ),
            items:
                ["Everyday", "Alternate Days", "Weekly"]
                    .map(
                      (freq) =>
                          DropdownMenuItem(value: freq, child: Text(freq)),
                    )
                    .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
