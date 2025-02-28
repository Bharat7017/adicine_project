import 'package:flutter/material.dart';

class DeviceSection extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onSelect;

  const DeviceSection({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 233, 231, 255),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDeviceButton(
            index: 0,
            icon: Icons.wifi_outlined,
            title: "Connect",
            subtitle: "Bluetooth, Wi-Fi",
          ),
          const SizedBox(height: 8),
          _buildDeviceButton(
            index: 1,
            icon: Icons.volume_up_outlined,
            title: "Sound Option",
            subtitle: "Ring, Silent, Vibrate",
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceButton({
    required int index,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onSelect(index),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
