import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';

class CheckDashboardCard extends StatelessWidget {
  CheckDashboardCard({super.key});

  final List<PieData> pies = [
    PieData(value: 0.15, color: Colors.tealAccent),
    PieData(value: 0.35, color: Colors.orange),
    PieData(value: 0.45, color: Colors.redAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Check Dashboard",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  "Here you will find everything related to your active and past medicines.",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 240, 240, 240),
            ),

            child: EasyPieChart(
              key: const Key('pie 0'),
              children: pies,
              borderEdge: StrokeCap.butt,
              pieType: PieType.crust,
              borderWidth: 5,
              gap: 0.0,
              start: 1,
            ),
          ),
        ],
      ),
    );
  }
}
