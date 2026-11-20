import 'package:flutter/material.dart';
import 'pin_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();

  void goToPinScreen() {
    String number = phoneController.text.trim();
    if (number.isEmpty) {
      number = '959782740';
    }
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PinScreen(phoneNumber: number),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F9EC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('images/ethio.png', height: 40, errorBuilder: (c, e, s) => const SizedBox()),
                    Image.asset('images/telebirr.png', height: 35, errorBuilder: (c, e, s) => const SizedBox()),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('English', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Icon(Icons.arrow_drop_down, color: Colors.black),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Center(
                  child: Column(
                    children: const [
                      Text('come to telebirr SuperApp!', style: TextStyle(color: Color(0xFF0088FF), fontSize: 22, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text('All-in-One', style: TextStyle(color: Color(0xFF0088FF), fontSize: 18, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      const Text('Login', style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Container(height: 3, width: 60, color: const Color(0xFF7CB342)),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Text('Mobile Number', style: TextStyle(color: Colors.black54, fontSize: 15)),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAFAFA),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 10.0),
                        child: Text('+251', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                      ),
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(fontSize: 18, letterSpacing: 1.5),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '959782740',
                            hintStyle: TextStyle(color: Colors.black38, letterSpacing: 1.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0088FF),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                    ),
                    onPressed: goToPinScreen,
                    child: const Text('Next', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500)),
                  ),
                ),
                const SizedBox(height: 25),
                Center(
                  child: RichText(
                    text: const TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                      children: [
                        TextSpan(text: 'Create New Account', style: TextStyle(color: Color(0xFF7CB342), fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('teleHub', style: TextStyle(color: Color(0xFF7CB342), fontSize: 16, fontWeight: FontWeight.w500)),
                    Text('Help', style: TextStyle(color: Color(0xFF7CB342), fontSize: 16, fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(height: 80),
                Center(
                  child: Column(
                    children: const [
                      Text('Terms and Conditions', style: TextStyle(color: Color(0xFF7CB342), fontSize: 14)),
                      SizedBox(height: 5),
                      Text('@2026 Ethio telecom.All rights reserved', style: TextStyle(color: Colors.black38, fontSize: 13)),
                      SizedBox(height: 5),
                      Text('1.3.3 version', style: TextStyle(color: Colors.black38, fontSize: 13)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
