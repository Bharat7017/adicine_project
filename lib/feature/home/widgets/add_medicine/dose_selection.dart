import 'package:flutter/material.dart';

class DoseSelection extends StatefulWidget {
  const DoseSelection({super.key});

  @override
  _DoseSelectionState createState() => _DoseSelectionState();
}

class _DoseSelectionState extends State<DoseSelection> {
  List<TimeOfDay?> doseTimes = [null, null, null]; // Stores selected times

  // Function to select time
  void _selectTime(BuildContext context, int index) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        doseTimes[index] = pickedTime; // Update selected time
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (index) {
        return GestureDetector(
          onTap: () => _selectTime(context, index),
          child: SizedBox(
            height: 35,
            child: ListTile(
              leading: Icon(Icons.access_time, size: 20),
              title: Text(
                doseTimes[index] != null
                    ? "Dose ${index + 1} - ${doseTimes[index]!.format(context)}"
                    : "Dose ${index + 1} - Select Time",
                style: TextStyle(fontSize: 14),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 14),
            ),
          ),
        );
      }),
    );
  }
}
