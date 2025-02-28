import 'package:flutter/material.dart';
import '../widgets/profile_section.dart';
import '../widgets/settings_options.dart';
import '../widgets/device_section.dart';
import '../widgets/caretakers_section.dart';
import '../widgets/doctor_section.dart';
import '../widgets/other_links.dart';
import '../widgets/logout_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int selectedIndex = 0;

  void onSelect(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileSection(),
            const SizedBox(height: 10),
            const Divider(),
            const Text(
              'Settings',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            const SettingsOptions(),
            const SizedBox(height: 20),
            const Text(
              'Device',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            DeviceSection(selectedIndex: selectedIndex, onSelect: onSelect),
            const SizedBox(height: 20),
            const CaretakersSection(),
            const SizedBox(height: 20),
            const Text(
              'Doctor',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            const DoctorSection(),
            const SizedBox(height: 20),
            const OtherLinks(),
            const SizedBox(height: 20),
            const LogoutButton(),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
