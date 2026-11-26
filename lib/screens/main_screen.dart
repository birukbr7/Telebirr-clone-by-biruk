import 'package:flutter/material.dart';
import 'package:telebirrbybr7/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    HomeScreen(),
    Center(child: Text('Payment')),
    Center(child: Text('Apps')),
    Center(child: Text('Engage')),
    Center(child: Text('Account')),
  ];

  Widget _buildNavIcon(IconData icon, int index) {
    final bool isSelected = _currentIndex == index;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isSelected)
          Container(
            width: 5,
            height: 5,
            margin: const EdgeInsets.only(bottom: 3),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          )
        else
          const SizedBox(height: 8),
        Icon(icon, size: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromRGBO(140, 198, 63, 1),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.85),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: (value) {
            setState(() => _currentIndex = value);
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: _buildNavIcon(Icons.home_outlined, 0),
            ),
            BottomNavigationBarItem(
              label: 'Payment',
              icon: _buildNavIcon(Icons.payments_outlined, 1),
            ),
            BottomNavigationBarItem(
              label: 'Apps',
              icon: _buildNavIcon(Icons.grid_view, 2),
            ),
            BottomNavigationBarItem(
              label: 'Engage',
              icon: _buildNavIcon(Icons.chat_bubble_outline, 3),
            ),
            BottomNavigationBarItem(
              label: 'Account',
              icon: _buildNavIcon(Icons.person_outline, 4),
            ),
          ],
        ),
      ),
    );
  }
}
