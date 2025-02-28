import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final String medicineName;
  final String timeInfo;
  final String status;
  final IconData statusIcon;
  final Color color;

  const MedicineCard({
    super.key,
    required this.medicineName,
    required this.timeInfo,
    required this.status,
    required this.statusIcon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 8)],
      ),
      child: Row(
        children: [
          const Icon(Icons.local_pharmacy, color: Colors.purple),
          const SizedBox(width: 12),
          Expanded(child: Text("$medicineName\n$timeInfo")),
          Column(
            children: [
              Icon(statusIcon, color: color),
              Text(status, style: TextStyle(color: color, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}
