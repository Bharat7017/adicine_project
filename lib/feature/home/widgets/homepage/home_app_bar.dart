import 'package:adhicine_project/feature/setting/views/setting_screen.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int medicinesLeft;
  final VoidCallback onAddMedicine;

  const HomeAppBar({
    super.key,
    required this.medicinesLeft,
    required this.onAddMedicine,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi Harry!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            '$medicinesLeft Medicines Left',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: onAddMedicine,
                child: Icon(
                  Icons.medical_services,
                  color: Color.fromARGB(255, 115, 134, 242),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
                },
                child: CircleAvatar(maxRadius: 17),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
