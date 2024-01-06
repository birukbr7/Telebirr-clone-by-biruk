import 'package:flutter/material.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Transaction Details',
          textAlign: TextAlign.end,
          style: TextStyle(
              color: Color.fromRGBO(19, 132, 185, 1),
              fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.keyboard_arrow_right_rounded,
          color: Color.fromRGBO(19, 132, 185, 1),
          weight: 12,
        )
      ],
    );
  }
}
