import 'package:flutter/material.dart';
import 'package:telebirrbybr7/screens/home_screen.dart';

class NotificationArea extends StatelessWidget {
  const NotificationArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 5.0),
          child: Icon(
            Icons.search,
            color: Colors.white,
            size: 20,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Badge(
            label: Text('23'),
            child: Icon(
              Icons.notifications_none_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        DropDownLang()
      ],
    );
  }
}
