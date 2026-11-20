import 'package:flutter/material.dart';
import 'loading_screen.dart';

class EnterAmountScreen extends StatefulWidget {
  final String recipientName;
  final String phoneNumber;
  final String transferType;

  const EnterAmountScreen({
    super.key, 
    required this.recipientName, 
    required this.phoneNumber, 
    required this.transferType
  });

  @override
  State<EnterAmountScreen> createState() => _EnterAmountScreenState();
}

class _EnterAmountScreenState extends State<EnterAmountScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  void proceedToLoading() {
    if (amountController.text.isNotEmpty) {
      Navigator.push(
        context,
        PageRouteBuilder(
          opaque: false, 
          pageBuilder: (context, _, __) => LoadingScreen(
            recipientName: widget.recipientName,
            amount: amountController.text,
            transactionType: widget.transferType,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter an amount')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // This checks if we are in the Bank screen or Send Money screen
    bool isBank = widget.transferType == 'Transfer to Bank';

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          isBank ? 'Transfer to Bank' : 'Send Money',
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          // --- HEADER SECTION ---
          if (isBank)
            // PURPLE HEADER FOR BANK
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: const Color(0xFF9C27B0), 
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: const Icon(Icons.account_balance, color: Color(0xFF7CB342), size: 30),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.recipientName, 
                          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Commercial Bank of Ethiopia (${widget.phoneNumber})',
                          style: const TextStyle(color: Colors.white70, fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          else
            // GREY HEADER FOR SEND MONEY
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              color: const Color(0xFFF5F5F5),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.person, color: Colors.white, size: 40),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.recipientName, 
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.phoneNumber, 
                          style: const TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          
          // --- AMOUNT & NOTES SECTION ---
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Amount',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      const SizedBox(height: 15),
                      
                      // Text Field with specific styles
                      Row(
                        children: [
                          // Green line only for Bank
                          if (isBank) Container(height: 30, width: 3, color: const Color(0xFF7CB342)),
                          if (isBank) const SizedBox(width: 10),
                          
                          Expanded(
                            child: TextField(
                              controller: amountController,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              autofocus: true, 
                              textAlign: isBank ? TextAlign.left : TextAlign.right,
                              textInputAction: TextInputAction.done, 
                              onSubmitted: (value) => proceedToLoading(),
                              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500, color: Colors.black),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                hintText: '', 
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          
                          Container(height: 20, width: 1, color: Colors.grey[300]),
                          const SizedBox(width: 10),
                          
                          const Text(
                            '(ETB)',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                      
                      // Balance text only for Bank
                      if (isBank) ...[
                        const SizedBox(height: 15),
                        const Text(
                          'Balance: 0.00(ETB)',
                          style: TextStyle(fontSize: 14, color: Color(0xFF546E7A)), 
                        ),
                      ]
                    ],
                  ),
                ),
                
                Divider(height: 1, thickness: 1, color: Colors.grey[200]),
                
                // Notes Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: TextField(
                    controller: notesController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Add notes(optional)',
                      // Green text for Bank, Blue-grey for Send Money
                      hintStyle: TextStyle(
                        color: isBank ? const Color(0xFF7CB342) : const Color(0xFF78909C), 
                        fontSize: 15
                      ), 
                    ),
                  ),
                ),
                Divider(height: 1, thickness: 1, color: Colors.grey[200]),
              ],
            ),
          ),
          
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Icon(Icons.keyboard_arrow_down, color: Colors.grey[400], size: 30),
          ),
        ],
      ),
    );
  }
}
