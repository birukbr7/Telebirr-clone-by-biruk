import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceNotifier {
  static final ValueNotifier<double> currentBalance =
      ValueNotifier<double>(800000.00);

  static void deduct(double amount) {
    final double updated = currentBalance.value - amount;
    currentBalance.value = updated > 0
        ? double.parse(updated.toStringAsFixed(2))
        : 0.00;
  }
}

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

  void toggleBalanceVisibility() {
    setState(() {
      showBalance = !showBalance;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isMainBalance = widget.label.toLowerCase().contains('balance');

    return Column(
      crossAxisAlignment: widget.crossAxisAlignment,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.label,
              style: TextStyle(
                color: const Color.fromRGBO(247, 255, 234, 1),
                fontSize: widget.labelFontSize,
              ),
            ),
            const SizedBox(width: 4),
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
        ValueListenableBuilder<double>(
          valueListenable: BalanceNotifier.currentBalance,
          builder: (context, liveBalance, _) {
            final String balance = !showBalance
                ? '******'
                : (isMainBalance ? liveBalance.toStringAsFixed(2) : '0.00');

            return Text(
              balance,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.balanceFontSize,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
