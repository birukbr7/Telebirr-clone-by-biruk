import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              gridIcon[index],
              const SizedBox(
                height: 5,
              ),
              Text(
                gridLabel[index],
                maxLines: 3,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w500,
                  height: 0,
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
  Widget build(BuildContextcontext) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: icon == Icons.ad_units_outlined
          ? Badge(
              label: const Text('+10%'),
              backgroundColor: Colors.amber,
              child: Icon(
                icon,
                color: const Color.fromRGBO(140, 197, 68, 0.85),
                size: 30,
              ),
            )
          : Icon(
              icon,
              color: const Color.fromRGBO(140, 197, 68, 0.85),
              size: 30,
            ),
    );
  }
}

List<Widget> topGridIcon = const [
  GridIcons(icon: Icons.wallet),
  GridIcons(icon: Icons.wallet_giftcard),
  GridIcons(icon: Icons.ad_units_outlined),
  GridIcons(icon: Icons.clean_hands_sharp),
  Image(image: AssetImage('images/dashen.png'), width: 20),
  Image(
    image: AssetImage('images/cbe.png'),
    width: 40,
  ),
  GridIcons(icon: Icons.storefront),
  GridIcons(icon: Icons.window_sharp),
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
