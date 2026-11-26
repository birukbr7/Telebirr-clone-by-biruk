import 'package:flutter/material.dart';
import 'send_amount_page.dart';

class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isValid = false;

  final List<Map<String, String>> _recentContacts = [
    {'name': 'Anewar', 'phone': '990103995'},
    {'name': 'sanyii', 'phone': '911223344'},
    {'name': 'Mengistu', 'phone': '911000001'},
    {'name': 'BIRHANE', 'phone': '911000002'},
    {'name': 'KENANISA', 'phone': '911000003'},
  ];

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(() {
      setState(() {
        _isValid = _phoneController.text.trim().length >= 9;
      });
    });
  }

  void _navigateToAmount(String rawPhone, {String? customName}) {
    final cleanDigits = rawPhone
        .trim()
        .replaceFirst(RegExp(r'^\+?251'), '')
        .replaceFirst(RegExp(r'^0+'), '');

    final formattedPhone = '251$cleanDigits';

    final matchedContact = _recentContacts.firstWhere(
      (c) => c['phone'] == cleanDigits,
      orElse: () => {
        'name': customName ?? 'Anewar',
        'phone': cleanDigits,
      },
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SendAmountPage(
          recipientName: matchedContact['name']!,
          phoneNumber: formattedPhone,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF8CC63F);
    const activeBlue = Color(0xFF008FD5);
    const disabledBlue = Color(0xFFC7E3F6);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Send Money to Individual',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FAYDA Promo Banner
            Container(
              height: 110,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Color(0xFF005B8F), Color(0xFF7AC143)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Link your telebirr\nwith FAYDA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Carousel Indicator Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: primaryGreen,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryGreen),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Mobile Number Input Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Please Enter Mobile Number',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: '9xxxxxxxx',
                      hintStyle: const TextStyle(color: Colors.black38),
                      prefixIcon: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                        child: Text(
                          '+251',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.qr_code_scanner,
                                color: primaryGreen),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.contact_phone_outlined,
                                color: primaryGreen),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: primaryGreen, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: primaryGreen, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _isValid
                          ? () => _navigateToAmount(_phoneController.text)
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: activeBlue,
                        disabledBackgroundColor: disabledBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Recent Contacts Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.grey),
                  onPressed: () {
                    setState(() => _recentContacts.clear());
                  },
                ),
              ],
            ),

            // Recent Contacts List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _recentContacts.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final contact = _recentContacts[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5A623),
                        borderRadius: BorderRadius.circular(6),
                      ),
child: const Icon(Icons.person, color: Colors.white),
),
title: Text(
contact['name']!,
style: const TextStyle(fontWeight: FontWeight.w500),
),
subtitle: Text(
'251${contact['phone']!}',
style: const TextStyle(fontSize: 12, color: Colors.black54),
),
trailing:
const Icon(Icons.chevron_right, color: Colors.grey),
onTap: () {
_phoneController.text = contact['phone']!;
_navigateToAmount(
contact['phone']!,
customName: contact['name'],
);
},
),
);
},
),
],
),
),
);
}
}
