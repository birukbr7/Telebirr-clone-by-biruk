import 'package:flutter/material.dart';
import 'package:telebirrbybr7/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final tabs = const [
    HomeScreen(),
    Center(
      child: Text('Payment'),
    ),
    Center(
      child: Text('Apps'),
    ),
    Center(
      child: Text('Account'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromRGBO(141, 199, 63, 0.85),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: (value) {
            setState(() => _currentIndex = value);
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Payment',
              icon: Icon(
                Icons.payment,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Apps',
              icon: Icon(
                Icons.apps,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Account',
              icon: Icon(
                Icons.person_2_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
