import 'package:flutter/material.dart';

class SignupText extends StatelessWidget {
  const SignupText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('New to Adhicine?'),
        GestureDetector(
          child: const Text(
            ' Sign up',
            style: TextStyle(color: Color.fromARGB(255, 115, 134, 242)),
          ),
        ),
      ],
    );
  }
}
