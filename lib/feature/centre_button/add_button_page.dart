import 'package:flutter/material.dart';

class AddButtonPage extends StatelessWidget {
  const AddButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Page")),
      body: Center(
        child: Text(
          "This is the Add Page!",
          style: TextStyle(color: Colors.amber, fontSize: 20),
        ),
      ),
    );
  }
}
