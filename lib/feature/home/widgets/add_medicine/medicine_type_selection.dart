import 'package:flutter/material.dart';

class MedicineTypeSelection extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeSelected;

  const MedicineTypeSelection({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    List<String> medicineTypes = [
      "Tablet",
      "Capsule",
      "Cream",
      "Liquid",
      "Injection",
      "Syrup",
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            medicineTypes.map((type) {
              return GestureDetector(
                onTap: () => onTypeSelected(type),
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.medical_services_outlined,
                        size: 40,
                        color: selectedType == type ? Colors.blue : Colors.grey,
                      ),
                      Text(type, style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
