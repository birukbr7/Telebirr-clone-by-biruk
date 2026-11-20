import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetupNumberScreen extends StatefulWidget {
  const SetupNumberScreen({super.key});

  @override
  State<SetupNumberScreen> createState() => _SetupNumberScreenState();
}

class _SetupNumberScreenState extends State<SetupNumberScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  void _sendFakeSms() async {
    String number = phoneController.text.trim();
    String amount = amountController.text.trim();
    String name = nameController.text.trim();

    if (number.isEmpty || amount.isEmpty || name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    String displayAmount = amount;
    if (!displayAmount.contains('.')) {
      displayAmount = '$amount.00';
    }

    String message = "Dear Customer you have received $displayAmount birr from +2519597***40 via tellebirr to your CBE $name thank you.";

    final Uri smsLaunchUri = Uri.parse('sms:$number?body=${Uri.encodeComponent(message)}');

    if (!await launchUrl(smsLaunchUri)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open SMS app')),
      );
    }
  }

  void _resetBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('current_balance', 245794.01);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Balance Reset to 245,794.01 ETB'), backgroundColor: Colors.green),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Fake SMS Sender',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Fill this out to send a fake CBE SMS to your friend.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Friend\'s Phone Number',
                hintText: 'e.g. 0911223344',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF7CB342), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: nameController,
              keyboardType: TextInputType.name,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Name or Account Number',
                hintText: 'e.g. Neja Kamil Nura',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF7CB342), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: amountController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Amount (ETB)',
                hintText: 'e.g. 500',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF7CB342), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: _sendFakeSms,
                icon: const Icon(Icons.message, color: Colors.white),
                label: const Text('Send Fake SMS', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 40),
            // THE RESET BUTTON
            TextButton.icon(
              onPressed: _resetBalance,
              icon: const Icon(Icons.refresh, color: Colors.red),
              label: const Text('Reset Balance to 245,794.01', style: TextStyle(color: Colors.red, fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
