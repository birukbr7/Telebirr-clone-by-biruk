import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  bool showBalance = false;

  void toggleBalanceVisibility() {
    setState(() {
      showBalance = !showBalance;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String balance =
        showBalance ? Random().nextInt(1000).toString() : '******';
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
          balance,
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
  }
}
