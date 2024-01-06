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
          size: 35,
        ),
        Text(
          'Selam, BirukBr7',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
