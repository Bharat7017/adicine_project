import 'package:flutter/material.dart';
import 'medicine_card.dart';

class MedicineList extends StatelessWidget {
  final List<Map<String, dynamic>> medicines;

  const MedicineList({super.key, required this.medicines});

  @override
  Widget build(BuildContext context) {
    if (medicines.isEmpty) {
      return Column(
        children: [
          SizedBox(height: 200),
          Center(
            child: SizedBox(
              height: 200,
              child: Image.asset('assets/images/empty.png'),
            ),
          ),
          Center(child: Text('No Medicines for today')),
        ],
      );
    }

    return ListView.builder(
      itemCount: medicines.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Morning 08:00 am',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              MedicineCard(medicine: medicines[index]),
              MedicineCard(medicine: medicines[index]),
              SizedBox(height: 10),
              Text(
                'Afternoon 02:00 pm',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              MedicineCard(medicine: medicines[index]),
              SizedBox(height: 10),
              Text(
                'Night 09:00 pm',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              MedicineCard(medicine: medicines[index]),
            ],
          ),
        );
      },
    );
  }
}
