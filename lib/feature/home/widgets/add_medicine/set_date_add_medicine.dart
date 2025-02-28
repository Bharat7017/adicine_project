import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting dates

class SetDateAddMedicine extends StatefulWidget {
  const SetDateAddMedicine({super.key});

  @override
  State<SetDateAddMedicine> createState() => _SetDateAddMedicineState();
}

class _SetDateAddMedicineState extends State<SetDateAddMedicine> {
  DateTime? startDate = DateTime.now();
  DateTime? endDate;

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    DateTime initialDate =
        isStartDate ? startDate ?? DateTime.now() : endDate ?? DateTime.now();
    DateTime firstDate = DateTime.now().subtract(
      Duration(days: 365),
    ); // 1 year back
    DateTime lastDate = DateTime.now().add(
      Duration(days: 365 * 5),
    ); // 5 years ahead

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Set Date", style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _selectDate(context, true),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        startDate != null
                            ? DateFormat('MMM dd, yyyy').format(startDate!)
                            : "Select Start Date",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: () => _selectDate(context, false),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        endDate != null
                            ? DateFormat('MMM dd, yyyy').format(endDate!)
                            : "Select End Date",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
