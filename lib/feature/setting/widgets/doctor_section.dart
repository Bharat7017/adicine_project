import 'package:flutter/material.dart';

class DoctorSection extends StatelessWidget {
  const DoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 233, 231, 255),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 149, 147, 251),
            ),
            child: Icon(Icons.add, color: Colors.white, size: 28),
          ),
          SizedBox(height: 5),
          Text(
            'Add Your Dcotor',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          RichText(
            text: TextSpan(
              text: 'Or use ',
              style: TextStyle(fontSize: 14, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: 'invite link',
                  style: TextStyle(color: Colors.amber),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
