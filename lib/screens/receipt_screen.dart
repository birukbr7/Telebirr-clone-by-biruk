import 'dart:math';
import 'package:flutter/material.dart';

class ReceiptScreen extends StatelessWidget {
  final String recipientName;
  final String amount;
  final String transferType;

  const ReceiptScreen({
    super.key, 
    required this.recipientName, 
    required this.amount, 
    required this.transferType
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final timeString = "${now.year}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    
    final random = Random();
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String txnNumber = 'DHP';
    for (int i = 0; i < 5; i++) {
      txnNumber += chars[random.nextInt(chars.length)];
    }
    for (int i = 0; i < 3; i++) {
      txnNumber += random.nextInt(10).toString();
    }

    String displayAmount = amount;
    if (!displayAmount.contains('.')) {
      displayAmount = '$amount.00';
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // 1. TOP BUTTONS (Made slightly smaller)
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.download, color: Color(0xFF7CB342), size: 20),
                        SizedBox(width: 4),
                        Text('Download', style: TextStyle(color: Color(0xFF7CB342), fontSize: 14)),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.share, color: Color(0xFF7CB342), size: 20),
                        SizedBox(width: 4),
                        Text('Share', style: TextStyle(color: Color(0xFF7CB342), fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 15),
              
              // 2. SUCCESS ICON (Reduced to 50)
              const Icon(Icons.check_circle, color: Color(0xFF7CB342), size: 50),
              const SizedBox(height: 8),
              const Text(
                'Successful',
                style: TextStyle(color: Color(0xFF7CB342), fontSize: 16, fontWeight: FontWeight.bold),
              ),
              
              const SizedBox(height: 25), 
              
              // 3. AMOUNT WITH MINUS SIGN (Reduced to 30 for numbers, 14 for ETB)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    '-', 
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87, height: 0.9),
                  ),
                  Text(
                    displayAmount,
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87, height: 0.9),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    '(ETB)',
                    style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              const Divider(thickness: 1, color: Color(0xFFEEEEEE)),
              const SizedBox(height: 10),

              // 4. DETAILS (Smaller text)
              _buildDetailRow('Transaction Time:', timeString),
              _buildDetailRow('Transaction Type:', transferType), 
              _buildDetailRow('Transaction To:', recipientName), 
              _buildDetailRow('Transaction Number:', txnNumber),
              
              const SizedBox(height: 10),
              
              // 5. QR CODE (Smaller)
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.qr_code, color: Color(0xFF7CB342), size: 20),
                  SizedBox(width: 4),
                  Text('QR Code', style: TextStyle(color: Color(0xFF7CB342), fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              ),
              
              const SizedBox(height: 15),
              
              // 6. BANNER (Reduced to 90 height)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'images/banner-2.jpg', 
                  height: 90, 
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 90,
                      color: const Color(0xFF7CB342),
                      child: const Center(
                        child: Text('Missing banner-2.jpg', style: TextStyle(color: Colors.white)),
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 10),
              
              // 7. DOTS (Smaller dots)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFF7CB342), shape: BoxShape.circle)),
                  const SizedBox(width: 6),
                  Container(width: 6, height: 6, decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle)),
                  const SizedBox(width: 6),
                  Container(width: 6, height: 6, decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle)),
                  const SizedBox(width: 6),
                  Container(width: 6, height: 6, decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle)),
                ],
              ),
              
              const Spacer(),
              
              // 8. FINISHED BUTTON
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50, 
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7CB342),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: const Text('Finished', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Smaller text and tighter spacing for the details
  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 13, color: Colors.grey[600])), 
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.w500), 
            ),
          ),
        ],
      ),
    );
  }
}
