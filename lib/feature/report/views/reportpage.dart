import 'package:adhicine_project/feature/report/widgets/check_history_selection.dart';
import 'package:adhicine_project/feature/report/widgets/report_summary.dart';
import 'package:flutter/material.dart';

import '../widgets/check_dashboard_card.dart';

import '../widgets/medicine_card.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  int selectedDateIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Report",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              const ReportSummaryCard(),

              const SizedBox(height: 16),

              CheckDashboardCard(),

              const SizedBox(height: 16),

              const CheckHistorySection(),

              const SizedBox(height: 16),
              _buildDateSelector(),
              const SizedBox(height: 20),

              const Text(
                "Morning 08:00 am",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),

              MedicineCard(
                medicineName: "Calpol 500mg Tablet",
                timeInfo: "Before Breakfast  |  Day 01",
                statusIcon: Icons.notifications_outlined,
                color: Colors.green,
                status: 'Taken',
              ),
              MedicineCard(
                status: 'Missed',
                medicineName: "Calpol 500mg Tablet",
                timeInfo: "Before Breakfast  |  Day 27",

                statusIcon: Icons.notifications_outlined,
                color: Colors.red,
              ),

              const SizedBox(height: 16),

              const Text(
                "Afternoon 02:00 pm",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              MedicineCard(
                status: 'Snoozed',
                medicineName: "Calpol 500mg Tablet",
                timeInfo: "After Food  |  Day 01",

                statusIcon: Icons.notifications_outlined,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    List<String> days = ["SUN", "MON", "TUE", "WED", "THU", "FRI"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(days.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedDateIndex = index;
            });
          },
          child: _buildDateCircle(
            days[index],
            "${index + 1}",
            index == selectedDateIndex,
          ),
        );
      }),
    );
  }

  Widget _buildDateCircle(String day, String number, bool isSelected) {
    return Column(
      children: [
        Text(day, style: TextStyle(color: Colors.grey)),
        SizedBox(height: 4),
        CircleAvatar(
          backgroundColor: isSelected ? Colors.blue : Colors.grey.shade200,
          child: Text(
            number,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      ],
    );
  }
}
