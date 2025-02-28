import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            const CircleAvatar(radius: 32),
            Positioned(
              left: 45,
              top: 45,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  size: 10,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Take Care!",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            Text(
              "Richa Bose",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}
