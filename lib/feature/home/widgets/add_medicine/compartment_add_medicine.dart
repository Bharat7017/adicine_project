import 'package:flutter/material.dart';

class CompartmentAddMedicine extends StatefulWidget {
  const CompartmentAddMedicine({super.key});

  @override
  State<CompartmentAddMedicine> createState() => _CompartmentAddMedicineState();
}

class _CompartmentAddMedicineState extends State<CompartmentAddMedicine> {
  int selectedCompartment = 1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(10, (index) {
          return GestureDetector(
            onTap: () => setState(() => selectedCompartment = index + 1),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                width: 47,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        selectedCompartment == index + 1
                            ? Colors.blue
                            : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text("${index + 1}", style: TextStyle(fontSize: 18)),
              ),
            ),
          );
        }),
      ),
    );
  }
}

//  CompartmentAddMedicine(
//                 ontap: () => setState(() => selectedCompartment = index + 1),
//                 color:
//                     selectedCompartment == index + 1
//                         ? Colors.blue
//                         : Colors.grey,
//               ),
