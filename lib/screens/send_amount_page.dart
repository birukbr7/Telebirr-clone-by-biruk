import 'package:flutter/material.dart';
import 'transaction_success_page.dart';

class SendAmountPage extends StatefulWidget {
  final String recipientName;
  final String phoneNumber;

  const SendAmountPage({
    super.key,
    required this.recipientName,
    required this.phoneNumber,
  });

  @override
  State<SendAmountPage> createState() => _SendAmountPageState();
}

class _SendAmountPageState extends State<SendAmountPage> {
  String _amount = '';
  final TextEditingController _notesController = TextEditingController();

  void _onKeyPress(String value) {
    setState(() {
      if (value == '.' && _amount.contains('.')) return;
      if (_amount.contains('.')) {
        final parts = _amount.split('.');
        if (parts.length > 1 && parts[1].length >= 2) return;
      }
      if (_amount == '0' && value != '.') {
        _amount = value;
      } else {
        _amount += value;
      }
    });
  }

  void _onBackspace() {
    if (_amount.isNotEmpty) {
      setState(() {
        _amount = _amount.substring(0, _amount.length - 1);
      });
    }
  }

  void _showConfirmationBottomSheet() {
    final double originalAmount = double.tryParse(_amount) ?? 0.0;
    const double serviceFee = 1.00;
    final double totalAmount = originalAmount + serviceFee;
    const double availableBalance = 118.89;
    const primaryGreen = Color(0xFF8CC63F);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF5F6F8),
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          ),
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.black87, size: 26),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Text(
                'Send Money to ${widget.recipientName}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: totalAmount.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const TextSpan(
                      text: 'ETB',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Original Amount',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                        Text(
                          '${originalAmount.toStringAsFixed(2)}ETB',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Service fee',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                        Text(
                          '${serviceFee.toStringAsFixed(2)}ETB',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
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
                      'Payment Method',
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: primaryGreen.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.account_balance_wallet,
                            color: primaryGreen,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Balance',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '(Available Balance:${availableBalance.toStringAsFixed(2)}ETB)',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.check_circle,
                          color: primaryGreen,
                          size: 24,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransactionSuccessPage(
                          amount: originalAmount,
                          recipientName: widget.recipientName,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Widget _buildKeyButton(String label, {VoidCallback? onTap}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          height: 52,
          child: ElevatedButton(
            onPressed: onTap ?? () => _onKeyPress(label),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: label == 'BACKSPACE'
                ? const Icon(Icons.backspace_outlined, size: 22)
                : Text(
                    label,
                    style: const TextStyle(
),
],
),
const Divider(height: 24, thickness: 1, color: Color(0xFFEEEEEE)),
TextField(
controller: _notesController,
decoration: const InputDecoration(
border: InputBorder.none,
hintText: 'Add notes(optional)',
hintStyle: TextStyle(color: Colors.black45, fontSize: 14),
isDense: true,
contentPadding: EdgeInsets.zero,
),
),
],
),
),
const Spacer(),
Padding(
padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
child: SizedBox(
width: double.infinity,
height: 48,
child: ElevatedButton(
onPressed: hasAmount ? _showConfirmationBottomSheet : null,
style: ElevatedButton.styleFrom(
backgroundColor: primaryGreen,
disabledBackgroundColor: disabledGreen,
foregroundColor: Colors.white,
disabledForegroundColor: Colors.white,
elevation: 0,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(8),
),
),
child: const Text(
'Next',
style: TextStyle(
fontSize: 16,
fontWeight: FontWeight.w600,
),
),
),
),
),
Container(
color: const Color(0xFFEBECEF),
padding: const EdgeInsets.fromLTRB(6, 6, 6, 16),
child: Column(
children: [
Row(
children: [
_buildKeyButton('1'),
_buildKeyButton('2'),
_buildKeyButton('3'),
],
),
Row(
children: [
_buildKeyButton('4'),
_buildKeyButton('5'),
_buildKeyButton('6'),
],
),
Row(
children: [
_buildKeyButton('7'),
_buildKeyButton('8'),
_buildKeyButton('9'),
],
),
Row(
children: [
_buildKeyButton('.'),
_buildKeyButton('0'),
_buildKeyButton('BACKSPACE', onTap: _onBackspace),
],
),
],
),
),
],
),
);
}
}
