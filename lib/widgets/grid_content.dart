import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/send_money_page.dart';

class GridContent extends StatelessWidget {
  const GridContent({
    super.key,
    required this.gridIcon,
    required this.gridLabel,
  });

  final List<Widget> gridIcon;
  final List<String> gridLabel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 10,
        childAspectRatio: 0.78,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        final String label = gridLabel[index];
        final bool isAirtime = label.toLowerCase().contains('airtime') ||
            label.toLowerCase().contains('package');

        return GestureDetector(
          onTap: () {
            if (label.toLowerCase().contains('send')) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SendMoneyPage(),
                ),
              );
            }
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    gridIcon[index],
                    const SizedBox(height: 6),
                    Text(
                      label,
                      maxLines: 4,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black87,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 11.5,
                        letterSpacing: 0.2,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              if (isAirtime)
                Positioned(
                  top: -7,
                  left: 4,
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF59E0B),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Up to 35%',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class GridIcons extends StatelessWidget {
  final IconData icon;
  const GridIcons({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Icon(
        icon,
        color: const Color.fromRGBO(140, 197, 68, 1),
        size: 30,
      ),
    );
  }
}

List<Widget> topGridIcon = const [
  GridIcons(icon: Icons.account_balance_wallet_outlined),
  GridIcons(icon: Icons.currency_exchange),
  GridIcons(icon: Icons.card_giftcard),
  GridIcons(icon: Icons.shopping_bag_outlined),
  Image(image: AssetImage('images/dashen.png'), width: 26),
  Image(image: AssetImage('images/cbe.png'), width: 36),
  GridIcons(icon: Icons.storefront),
  GridIcons(icon: Icons.account_balance_outlined),
];

List<Widget> bottomGridIcon = const [
  Image(image: AssetImage('images/christmas.png'), width: 70),
  Image(image: AssetImage('images/ethio-logo.png'), width: 30),
  GridIcons(icon: Icons.calendar_month_outlined),
  GridIcons(icon: FontAwesomeIcons.bank),
  GridIcons(icon: Icons.wallet_sharp),
  GridIcons(icon: Icons.payments_outlined),
  GridIcons(icon: Icons.location_on),
  GridIcons(icon: Icons.add_circle_outline_sharp),
];
