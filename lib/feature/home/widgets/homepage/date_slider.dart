import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSlider extends StatefulWidget {
  const DateSlider({super.key});

  @override
  State<DateSlider> createState() => _DateSliderState();
}

class _DateSliderState extends State<DateSlider> {
  int _selectedIndex = 1;
  final List<DateTime> _dates = List.generate(
    7,
    (index) => DateTime.now().add(Duration(days: index - 2)),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _dates.length,
        itemBuilder: (context, index) {
          bool isSelected = index == _selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  if (isSelected && index > 0) // Left Arrow
                    Icon(Icons.chevron_left, color: Colors.blue),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          isSelected
                              ? 15
                              : 10, // Bigger padding for selected date
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.black87 : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        isSelected
                            ? DateFormat('EEEE, MMM d').format(
                              _dates[index],
                            ) // Full date
                            : DateFormat('E').format(_dates[index]), // Only day
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.white : Colors.grey,
                        ),
                      ),
                    ),
                  ),

                  if (isSelected && index < _dates.length - 1) // Right Arrow
                    Icon(Icons.chevron_right, color: Colors.blue),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
