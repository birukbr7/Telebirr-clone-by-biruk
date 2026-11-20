import 'package:flutter/material.dart';
import 'enter_amount_screen.dart'; 

class TransferInputScreen extends StatefulWidget {
  final String transferType;

  const TransferInputScreen({super.key, required this.transferType});

  @override
  State<TransferInputScreen> createState() => _TransferInputScreenState();
}

class _TransferInputScreenState extends State<TransferInputScreen> {
  final TextEditingController nameController = TextEditingController();

  void goToAmountScreen() {
    String input = nameController.text.trim();
    if (input.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a mobile number')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EnterAmountScreen(
          recipientName: input, 
          phoneNumber: input, 
          transferType: widget.transferType,
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
          'Send Money to Individual',
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
                  'images/banner-1.jpg', // <--- USING BANNER-1
                  height: 110,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 110,
                      color: Colors.grey[300],
                      child: const Center(child: Text('Missing banner-1.jpg')),
                    );
                  },
                ),
              ),
            ),

            // 2. Dots Indicator 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 7, height: 7, decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle)),
                const SizedBox(width: 6),
                Container(width: 7, height: 7, decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle)),
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
                      'Please Enter Mobile Number',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black87),
                    ),
                    const SizedBox(height: 15),
                    
                    TextField(
                      controller: nameController,
                      keyboardType: TextInputType.text, 
                      style: const TextStyle(fontSize: 18, color: Colors.black), 
                      decoration: InputDecoration(
                        hintText: '+251', 
                        hintStyle: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w400, fontSize: 18),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFF7CB342), width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFF7CB342), width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFF7CB342), width: 1.5),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.qr_code_scanner, color: Color(0xFF7CB342), size: 32),
                              SizedBox(width: 15),
                              Icon(Icons.contact_page, color: Color(0xFF7CB342), size: 32),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB3E5FC), 
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

            // 4. RECENT SECTION 
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
                                width: 85,
                                height: 85,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF689F38), 
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              Container(
                                width: 85,
                                height: 85,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF8BC34A), 
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.check, size: 50, color: Colors.white),
                              ),
                              Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 2),
                                ),
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
                                    Container(
                                      width: 14,
                                      height: 2,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text('No recent receiver', style: TextStyle(color: Colors.grey[600], fontSize: 15)),
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
