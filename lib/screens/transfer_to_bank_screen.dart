import 'package:flutter/material.dart';
import 'enter_amount_screen.dart'; // <--- Uses the same Amount Screen!

class TransferToBankScreen extends StatefulWidget {
  const TransferToBankScreen({super.key});

  @override
  State<TransferToBankScreen> createState() => _TransferToBankScreenState();
}

class _TransferToBankScreenState extends State<TransferToBankScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController accountController = TextEditingController();

  void goToAmountScreen() {
    String name = nameController.text.trim();
    String account = accountController.text.trim();

    if (name.isEmpty || account.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter Name and Account Number')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EnterAmountScreen(
          recipientName: name, 
          phoneNumber: account, 
          transferType: 'Transfer to Bank', // Triggers the purple UI!
        ),
      ),
    );
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
          'Transfer to Bank',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. THE BANNER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'images/banner-3.jpg', 
                  height: 110,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 110,
                      color: const Color(0xFF1E3F20), 
                      child: const Center(
                        child: Text('Zemen Gebeya Banner', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    );
                  },
                ),
              ),
            ),

            // 2. Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 7, height: 7, decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle)),
                const SizedBox(width: 6),
                Container(width: 7, height: 7, decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle)),
              ],
            ),
            
            const SizedBox(height: 15),

            // 3. THE WHITE CARD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Bank',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    const SizedBox(height: 8),
                    
                    // Fake Dropdown
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!, width: 1.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Commercial Bank of Ethiopia',
                            style: TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                          Icon(Icons.keyboard_arrow_down, color: Colors.black54),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 20),

                    // Recipient Name
                    const Text(
                      'Recipient Name',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(fontSize: 18, color: Colors.black), 
                      decoration: InputDecoration(
                        hintText: 'e.g. Mr Neja Kamil Nura',
                        hintStyle: const TextStyle(color: Colors.black38, fontSize: 16),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF7CB342), width: 1.5)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF7CB342), width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF7CB342), width: 1.5)),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Account No
                    const Text(
                      'Account No',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: accountController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 18, color: Colors.black), 
                      decoration: InputDecoration(
                        hintText: 'Enter Account Number',
                        hintStyle: const TextStyle(color: Colors.black38, fontSize: 16),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF7CB342), width: 1.5)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF7CB342), width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF7CB342), width: 1.5)),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // NEXT BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE0E0E0), 
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 0,
                        ),
                        onPressed: goToAmountScreen, 
                        child: const Text('Next', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 4. RECENT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Recent', style: TextStyle(fontSize: 18, color: Colors.black87)),
                    const SizedBox(height: 60),
                    Center(
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 6, bottom: 6),
                                width: 85, height: 85,
                                decoration: BoxDecoration(color: const Color(0xFF689F38), borderRadius: BorderRadius.circular(8)),
                              ),
                              Container(
                                width: 85, height: 85,
                                decoration: BoxDecoration(color: const Color(0xFF8BC34A), borderRadius: BorderRadius.circular(8)),
                                child: const Icon(Icons.check, size: 50, color: Colors.white),
                              ),
                              Container(
                                width: 42, height: 42,
                                decoration: BoxDecoration(color: Colors.amber, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.close, size: 10, color: Colors.black),
                                        SizedBox(width: 6),
                                        Icon(Icons.close, size: 10, color: Colors.black),
                                      ],
                                    ),
                                    Container(width: 14, height: 2, color: Colors.black)
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text('No Record', style: TextStyle(color: Colors.grey[600], fontSize: 15)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
