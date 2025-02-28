import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final Map<String, dynamic> medicine;

  const MedicineCard({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    String medicineName = medicine['name'] ?? 'Unknown Medicine';
    String medicineType = medicine['type'] ?? '';
    String time = medicine['time'] ?? 'Unknown Time';
    String frequency = medicine['frequency'] ?? '';
    String statusText = medicine['status'] ?? "Left";

    IconData statusIcon;
    Color statusColor;

    switch (statusText) {
      case "Taken":
        statusIcon = Icons.notifications_outlined;
        statusColor = Colors.green;
        break;
      case "Missed":
        statusIcon = Icons.notifications_outlined;
        statusColor = Colors.red;
        break;
      case "Snoozed":
        statusIcon = Icons.notifications_outlined;
        statusColor = Colors.orange;
        break;
      case "Left":
      default:
        statusIcon = Icons.notifications_outlined;
        statusColor = Colors.grey;
    }

    return Card(
      margin: EdgeInsets.all(5),
      child: SizedBox(
        height: 80,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: medicine['color'] ?? Colors.blueAccent,
            child: Icon(Icons.medication, color: Colors.white),
          ),
          title: Text('$medicineName $medicineType'),
          subtitle: Text('$time  |  $frequency'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(statusIcon, color: statusColor),
              Text(
                statusText,
                style: TextStyle(fontSize: 12, color: statusColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
