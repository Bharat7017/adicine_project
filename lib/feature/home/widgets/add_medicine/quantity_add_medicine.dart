import 'package:flutter/material.dart';

class QuantityAddMedicine extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const QuantityAddMedicine({
    super.key,
    required this.quantity,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 40,
          width: 240,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            controller: TextEditingController(text: "Take $quantity Pill"),
            readOnly: true,
          ),
        ),
        GestureDetector(
          onTap: onDecrement,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 2,
                color: Color.fromARGB(255, 115, 134, 242),
              ),
            ),
            child: Icon(Icons.remove),
          ),
        ),
        GestureDetector(
          onTap: onIncrement,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 115, 134, 242),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
