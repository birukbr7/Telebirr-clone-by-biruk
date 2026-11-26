import 'package:flutter/material.dart';

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

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasAmount =
        _amount.isNotEmpty && (double.tryParse(_amount) ?? 0) > 0;
    const primaryGreen = Color(0xFF8CC63F);
    const disabledGreen = Color(0xFFD5E8C4);

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
          'Send Money',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFFF5F6F8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5A623),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.person, color: Colors.white, size: 32),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.recipientName,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.phoneNumber,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Amount',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          _amount,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 1,
                        color: Colors.grey.shade300,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      const Text(
                        '(ETB)',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24, thickness: 1),
                  TextField(
                    controller: _notesController,
                    decoration: const InputDecoration(
                      hintText: 'Add notes(optional)',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: const Color(0xFFF2F3F5),
            padding:
                const EdgeInsets.only(top: 6, left: 6, right: 6, bottom: 12),
            child: Column(
              children: [
                const Icon(Icons.keyboard_arrow_down,
                    color: Colors.grey, size: 20),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          _buildNumRow('1', '2', '3'),
                          const SizedBox(height: 6),
                          _buildNumRow('4', '5', '6'),
                          const SizedBox(height: 6),
                          _buildNumRow('7', '8', '9'),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Expanded(flex: 2, child: _buildKeyButton('0')),
                              const SizedBox(width: 6),
                              Expanded(flex: 1, child: _buildKeyButton('.')),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 52,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _onBackspace,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black87,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: const Icon(Icons.backspace_outlined,
                                  size: 22),
                            ),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            height: 168,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: hasAmount ? () {} : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryGreen,
                                disabledBackgroundColor: disabledGreen,
                                foregroundColor: Colors.white,
                                disabledForegroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumRow(String first, String second, String third) {
    return Row(
      children: [
        Expanded(child: _buildKeyButton(first)),
        const SizedBox(width: 6),
        Expanded(child: _buildKeyButton(second)),
        const SizedBox(width: 6),
        Expanded(child: _buildKeyButton(third)),
      ],
    );
  }

  Widget _buildKeyButton(String label) {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: () => _onKeyPress(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
