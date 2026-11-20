import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BalanceInfo extends StatefulWidget {
  final String label;
  final double labelFontSize;
  final double balanceFontSize;
  final CrossAxisAlignment crossAxisAlignment;

  const BalanceInfo({
    super.key,
    required this.label,
    required this.labelFontSize,
    required this.balanceFontSize,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  State<BalanceInfo> createState() => _BalanceInfoState();
}

class _BalanceInfoState extends State<BalanceInfo> {
  bool showBalance = true;

  // Helper to add commas (e.g. 245794.01 -> 245,794.01)
  String _formatBalance(double balance) {
    String formatted = balance.toStringAsFixed(2);
    List<String> parts = formatted.split('.');
    String integerPart = parts[0];
    String decimalPart = parts[1];
    
    String formattedInteger = '';
    int count = 0;
    for (int i = integerPart.length - 1; i >= 0; i--) {
      formattedInteger = integerPart[i] + formattedInteger;
      count++;
      if (count % 3 == 0 && i != 0) {
        formattedInteger = ',' + formattedInteger;
      }
    }
    return '$formattedInteger.$decimalPart';
  }

  void toggleBalanceVisibility() {
    setState(() {
      showBalance = !showBalance;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Only the main 'Balance' drops. Endekise and Reward stay as stars.
    bool isMainBalance = widget.label.contains('Balance');
    
    return FutureBuilder<double>(
      future: SharedPreferences.getInstance().then((prefs) => prefs.getDouble('current_balance') ?? 245794.01),
      builder: (context, snapshot) {
        String displayBalance = '******';
        
        if (isMainBalance && snapshot.hasData) {
          displayBalance = showBalance ? _formatBalance(snapshot.data!) : '******';
        }
        
        return Column(
          crossAxisAlignment: widget.crossAxisAlignment,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.label,
                  style: TextStyle(
                    color: const Color.fromRGBO(247, 255, 234, 1),
                    fontSize: widget.labelFontSize,
                  ),
                ),
                if (isMainBalance)
                  InkWell(
                    onTap: toggleBalanceVisibility,
                    child: Icon(
                      !showBalance
                          ? Icons.remove_red_eye_sharp
                          : Icons.visibility_off,
                      size: 13,
                      color: const Color.fromRGBO(247, 255, 234, 1),
                    ),
                  ),
              ],
            ),
            Text(
              displayBalance,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.balanceFontSize,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
