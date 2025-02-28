import 'package:flutter/material.dart';

class SettingsOptions extends StatelessWidget {
  const SettingsOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSettingsItem(
          Icons.notifications_outlined,
          "Notification",
          "Check your medicine notification",
        ),
        _buildSettingsItem(
          Icons.volume_up_outlined,
          "Sound",
          "Ring, Silent, Vibrate",
        ),
        _buildSettingsItem(
          Icons.person_outline,
          "Manage Your Account",
          "Password, Email ID, Phone Number",
        ),
      ],
    );
  }

  Widget _buildSettingsItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
    );
  }
}
