import 'package:adhicine_project/feature/home/widgets/homepage/date_slider.dart';
import 'package:adhicine_project/feature/home/widgets/homepage/home_app_bar.dart';
import 'package:adhicine_project/feature/home/widgets/homepage/medicine_list.dart';
import 'package:flutter/material.dart';
import 'package:adhicine_project/feature/home/views/add_medicine_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> medicines = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        medicinesLeft: medicines.length,
        onAddMedicine: () async {
          final newMedicine = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMedicineScreen()),
          );

          if (newMedicine != null) {
            setState(() {
              medicines.add(newMedicine);
            });
          }
        },
      ),
      body: Column(
        children: [
          DateSlider(),
          SizedBox(height: 20),
          Expanded(child: MedicineList(medicines: medicines)),
        ],
      ),
    );
  }
}
