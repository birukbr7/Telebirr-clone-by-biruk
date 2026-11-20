import 'package:flutter/material.dart';
import 'main_screen.dart'; // Imports your real home screen

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';
  bool _isObscured = true;

  void _checkPassword() {
    // 🚨 THIS IS YOUR PASSWORD 🚨
    if (_passwordController.text == 'baba@1234') {
      // If correct, go to the app
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } else {
      // If wrong, show an error
      setState(() {
        _errorMessage = 'Wrong Password! Access Denied.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Telebirr Logo or Icon
              const Icon(
                Icons.lock_outline,
                size: 80,
                color: Color(0xFF7CB342), // Telebirr Green
              ),
              const SizedBox(height: 20),
              const Text(
                'Enter App Password',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),

              // Password Text Field
              TextField(
                controller: _passwordController,
                obscureText: _isObscured,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF7CB342), width: 2),
                  ),
                  errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Unlock Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7CB342),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: _checkPassword,
                  child: const Text(
                    'Unlock',
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
