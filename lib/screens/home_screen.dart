import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marquee/marquee.dart';
import 'package:telebirrbybr7/constants.dart';
import 'package:telebirrbybr7/widgets/balance_info.dart';
import 'package:telebirrbybr7/widgets/grid_content.dart';
import 'package:telebirrbybr7/widgets/notification_area.dart';
import 'package:telebirrbybr7/widgets/transaction%20detail.dart';
import 'package:telebirrbybr7/widgets/user_introduction.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 246, 248, 1),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'images/ethio.png',
              width: 115,
            ),
            Image.asset(
              'images/telebirr.png',
              width: 68,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Green Header with curved orange Marquee strip
              Stack(
                children: [
                  Container(
                    height: 185,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(147, 204, 68, 1),
                          Color.fromRGBO(124, 184, 50, 1),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(12, 4, 12, 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UserIntroduction(),
                              NotificationArea(),
                            ],
                          ),
                          BalanceInfo(
                            label: 'Balance (ETB) ',
                            balanceFontSize: 28,
                            labelFontSize: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BalanceInfo(
                                  label: 'Endekise (ETB) ',
                                  balanceFontSize: 19,
                                  labelFontSize: 14,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                                BalanceInfo(
                                  label: 'Reward (ETB) ',
                                  balanceFontSize: 19,
                                  labelFontSize: 14,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 16,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(245, 158, 11, 0.95),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Marquee(
                        text: 'ONE APP FOR ALL YOUR NEEDS!',
                        blankSpace: 350,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Main Scrollable Grid, FAYDA Banner & Transaction Details
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 12, 10, 90),
                    child: Column(
                      children: [
                        GridContent(
                          gridIcon: topGridIcon,
                          gridLabel: topGridLabel,
                        ),
                        const SizedBox(height: 14),
                        CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            viewportFraction: 0.92,
                            aspectRatio: 34 / 9,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                          ),
                          items: carouselImages.map((image) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: image,
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 6),
                        ImageSliderIndicator(
                          carouselImages: carouselImages,
                          currentIndex: _currentIndex,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 4.0, bottom: 12.0),
                          child: TransactionDetails(),
                        ),
                        GridContent(
                          gridIcon: bottomGridIcon,
                          gridLabel: bottomGridLabel,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Centered Blue Scan QR Button + Floating Location Pin on Right
          Positioned(
            left: 0,
            right: 0,
            bottom: 12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  const SizedBox(width: 44),
                  Expanded(
                    child: SizedBox(
                      height: 46,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.qr_code_scanner_rounded,
                          color: Colors.white,
                          size: 22,
                        ),
                        label: const Text(
                          'Scan QR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(0, 143, 213, 1),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.location_on_outlined,
                      color: Color.fromRGBO(140, 198, 63, 1),
                      size: 26,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageSliderIndicator extends StatelessWidget {
const ImageSliderIndicator({
super.key,
required this.carouselImages,
required int currentIndex,
}) : _currentIndex = currentIndex;
final List carouselImages;
final int _currentIndex;
@override
Widget build(BuildContext context) {
return DotsIndicator(
dotsCount: carouselImages.length,
position: _currentIndex,
decorator: DotsDecorator(
size: const Size.square(7.0),
activeSize: const Size.square(7.0),
activeColor: const Color.fromRGBO(140, 198, 63, 1),
color: Colors.white,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(15.0),
side: const BorderSide(
color: Color.fromRGBO(140, 198, 63, 1),
width: 1.5,
),
),
activeShape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(15.0),
),
),
);
}
}
class DropDownLang extends StatelessWidget {
const DropDownLang({
super.key,
});
@override
Widget build(BuildContext context) {
return DropdownButtonHideUnderline(
child: DropdownButton(
hint: const Text(
'Eng',
style: TextStyle(
color: Colors.white,
fontSize: 14,
),
),
icon: const Icon(
Icons.arrow_drop_down,
color: Colors.white,
size: 20,
),
items: const [],
onChanged: (value) {},
),
);
}
}
