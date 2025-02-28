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
        return MedicineCard(medicine: medicines[index]);
      },
    );
  }
}
