import 'package:flutter/material.dart';

class TotalCountSlider extends StatelessWidget {
  final int totalCount;
  final ValueChanged<int> onChanged;

  const TotalCountSlider({
    super.key,
    required this.totalCount,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Count", style: TextStyle(fontWeight: FontWeight.w500)),
            Container(
              height: 17,
              width: 30,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              alignment: Alignment.center,
              child: Text(" $totalCount ", style: TextStyle(fontSize: 10)),
            ),
          ],
        ),
        Slider(
          value: totalCount.toDouble(),
          min: 1,
          max: 100,
          divisions: 99,
          thumbColor: Color.fromARGB(255, 115, 134, 242),
          activeColor: Color.fromARGB(255, 115, 134, 242),
          label: totalCount.toString(),
          onChanged: (value) => onChanged(value.toInt()),
        ),
      ],
    );
  }
}
