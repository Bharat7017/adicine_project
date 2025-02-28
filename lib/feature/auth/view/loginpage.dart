import 'package:adhicine_project/Feature/auth/widgets/custom_text_filed.dart';
import 'package:adhicine_project/Feature/auth/widgets/login_button.dart';
import 'package:adhicine_project/Feature/auth/widgets/signup_text.dart';
import 'package:adhicine_project/Feature/auth/widgets/social_login_button.dart';
import 'package:adhicine_project/core/common/bottom_navigation_screen.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  String? _emailError;
  String? _passwordError;

  void _validateAndSubmit() {
    setState(() {
      _emailError =
          _emailController.text.isEmpty
              ? 'Email cannot be empty'
              : !_emailController.text.contains('@')
              ? 'Incorrect Email Address'
              : null;
      _passwordError =
          _passwordController.text.isEmpty ? 'Password cannot be empty' : null;
    });

    if (_emailError == null && _passwordError == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 100,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Sign In',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),

              CustomTextField(
                controller: _emailController,
                labelText: 'Email',
                prefixIcon: Icons.alternate_email,
                errorText: _emailError,
              ),

              const SizedBox(height: 10),

              CustomTextField(
                controller: _passwordController,
                labelText: 'Password',
                prefixIcon: Icons.lock_outline,
                errorText: _passwordError,
                obscureText: !_isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),

              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Color.fromARGB(255, 115, 134, 242)),
                ),
              ),
              const SizedBox(height: 40),

              LoginButton(onPressed: _validateAndSubmit),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 140, child: Divider()),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR'),
                  ),
                  const SizedBox(width: 140, child: Divider()),
                ],
              ),
              const SizedBox(height: 30),

              SocialLoginButton(
                imagePath: 'assets/images/google.png',
                text: 'Continue with Google',
              ),

              const SizedBox(height: 50),
              SignupText(),
            ],
          ),
        ),
      ),
    );
  }
}
