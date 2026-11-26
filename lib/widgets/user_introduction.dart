import 'package:flutter/material.dart';

class UserIntroduction extends StatelessWidget {
  const UserIntroduction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.person,
          color: Colors.white,
          size: 36,
        ),
        SizedBox(width: 8),
        Text(
          'Selam, Samuel',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
