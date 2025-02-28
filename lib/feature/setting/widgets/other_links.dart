import 'package:flutter/material.dart';

class OtherLinks extends StatelessWidget {
  const OtherLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLinkTile("Privacy Policy"),
        _buildLinkTile("Terms and Conditions"),
        _buildLinkTile("Rate Us"),
        _buildLinkTile("Share App"),
      ],
    );
  }

  Widget _buildLinkTile(String title) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
