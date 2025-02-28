import 'package:adhicine_project/feature/home/widgets/add_medicine/add_button.dart';
import 'package:adhicine_project/feature/home/widgets/add_medicine/color_add_medicine.dart';
import 'package:adhicine_project/feature/home/widgets/add_medicine/compartment_add_medicine.dart';
import 'package:adhicine_project/feature/home/widgets/add_medicine/dose_selection.dart';
import 'package:adhicine_project/feature/home/widgets/add_medicine/food_timing_selection.dart';
import 'package:adhicine_project/feature/home/widgets/add_medicine/frequency_selection.dart';
import 'package:adhicine_project/feature/home/widgets/add_medicine/medicine_name.dart';
import 'package:adhicine_project/feature/home/widgets/add_medicine/medicine_type_selection.dart';
import 'package:adhicine_project/feature/home/widgets/add_medicine/quantity_add_medicine.dart';
import 'package:adhicine_project/feature/home/widgets/add_medicine/set_date_add_medicine.dart';
import 'package:adhicine_project/feature/home/widgets/add_medicine/time_per_day_selection.dart';
import 'package:adhicine_project/feature/home/widgets/add_medicine/total_count_slider.dart';
import 'package:flutter/material.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  Color selectedColor = Colors.purple;
  String selectedType = "Tablet";
  int quantity = 1;
  int totalCount = 1;
  String frequency = "Everyday";
  String timesPerDay = "Three Times";
  String intakeTime = "Before Food";

  List<Color> colors = [
    const Color.fromARGB(255, 246, 197, 255),
    const Color.fromARGB(255, 116, 158, 255),
    const Color.fromARGB(255, 255, 169, 162),
    const Color.fromARGB(255, 178, 255, 180),
    const Color.fromARGB(255, 255, 221, 169),
    const Color.fromARGB(255, 255, 208, 223),
    const Color.fromARGB(255, 255, 248, 189),
  ];
  List<String> medicineTypes = [
    "Tablet",
    "Capsule",
    "Cream",
    "Liquid",
    "Injection",
    "Syrup",
  ];
  List<String> foodTimings = ["Before Food", "After Food", "Before Sleep"];

  void updateQuantity(int change) {
    setState(() {
      quantity = (quantity + change).clamp(1, 10);
    });
  }

  TextEditingController medicineNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Add Medicines",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              MedicineName(controller: medicineNameController),
              SizedBox(height: 15),

              Text(
                "Compartment",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              CompartmentAddMedicine(),

              SizedBox(height: 15),

              // Color Selection
              Text("Colour", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 10),

              ColorAddMedicine(
                colors: colors,
                selectedColor: selectedColor,
                onColorSelected: (color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
              ),

              SizedBox(height: 15),

              // Medicine Type
              Text("Type", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 10),
              MedicineTypeSelection(
                selectedType: selectedType,
                onTypeSelected: (type) {
                  setState(() {
                    selectedType = type;
                  });
                },
              ),

              SizedBox(height: 15),

              // Quantity Picker
              Text("Quantity", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 10),
              QuantityAddMedicine(
                quantity: quantity,
                onDecrement: () => updateQuantity(-1),
                onIncrement: () => updateQuantity(1),
              ),
              SizedBox(height: 15),

              TotalCountSlider(
                totalCount: totalCount,
                onChanged: (value) {
                  setState(() {
                    totalCount = value.toInt();
                  });
                },
              ),

              SizedBox(height: 15),

              SetDateAddMedicine(),
              SizedBox(height: 15),

              FrequencySelection(
                frequency: frequency,
                onChanged: (value) {
                  setState(() {
                    frequency = value;
                  });
                },
              ),

              SizedBox(height: 15),

              TimePerDaySelection(
                timesPerDay: timesPerDay,
                onChanged: (value) {
                  setState(() {
                    timesPerDay = value;
                  });
                },
              ),

              SizedBox(height: 15),

              DoseSelection(),

              SizedBox(height: 15),

              FoodTimingSelection(
                foodTimings: foodTimings,
                intakeTime: intakeTime,
                onTimeSelected: (time) {
                  setState(() {
                    intakeTime = time;
                  });
                },
              ),

              SizedBox(height: 20),

              AddButton(
                onTap: () {
                  Navigator.pop(context, {
                    'name': medicineNameController.text,
                    'type': selectedType,
                    'quantity': quantity,
                    'time': intakeTime,
                    'frequency': frequency,
                    'color': selectedColor,
                  });
                },
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
