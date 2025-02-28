import 'package:flutter/material.dart';

class CheckHistorySection extends StatelessWidget {
  const CheckHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Check History",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios, size: 16),
      ],
    );
  }
}
