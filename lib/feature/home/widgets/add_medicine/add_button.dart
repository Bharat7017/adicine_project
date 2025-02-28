import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromARGB(255, 115, 134, 242),
        ),
        child: Center(
          child: Text(
            'Add',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
