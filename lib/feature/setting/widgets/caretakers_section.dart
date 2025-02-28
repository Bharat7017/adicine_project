import 'package:flutter/material.dart';

class CaretakersSection extends StatelessWidget {
  const CaretakersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Caretakers: 03",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          height: 130,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 233, 231, 255),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCaretakerAvatar("Dipa Luna"),
              _buildCaretakerAvatar("Roz Sod.."),
              _buildCaretakerAvatar("Sunny Tu.."),
              _buildCaretakerAvatar("Add", isAddButton: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCaretakerAvatar(String name, {bool isAddButton = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: isAddButton ? Colors.white : Colors.blue,
          radius: 24,
          child:
              isAddButton
                  ? const Icon(Icons.add)
                  : Text(name[0], style: const TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 4),
        Text(name, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
