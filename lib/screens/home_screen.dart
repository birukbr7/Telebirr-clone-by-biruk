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
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromRGBO(140, 199, 63, 1),
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'images/ethio.png',
              width: 100,
            ),
            Image.asset(
              'images/telebirr.png',
              width: 60,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 170,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(140, 199, 63, 1),
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
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
                        balanceFontSize: 25,
                        labelFontSize: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BalanceInfo(
                            label: 'Endekise (ETB) ',
                            balanceFontSize: 17,
                            labelFontSize: 13,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          BalanceInfo(
                            label: 'Reward (ETB) ',
                            balanceFontSize: 17,
                            labelFontSize: 13,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 15,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(251, 187, 71, 0.9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                  ),
                  child: Marquee(
                    text: 'ONE APP FOR ALL YOUR NEEDS!',
                    blankSpace: 400,
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
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8, top: 5, bottom: 10),
                child: Column(
                  children: [
                    GridContent(
                      gridIcon: topGridIcon,
                      gridLabel: topGridLabel,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 39 / 9,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: carouselImages.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: Container(
                                child: image,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    ImageSliderIndicator(
                      carouselImages: carouselImages,
                      currentIndex: _currentIndex,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: TransactionDetails(),
                    ),
                    GridContent(
                      gridIcon: bottomGridIcon,
                      gridLabel: bottomGridLabel,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
          right: 30.0,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: () {},
            color: const Color.fromRGBO(2, 135, 208, 1),
            textColor: Colors.white,
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.qr_code_scanner_rounded,
                    size: 24,
                  ),
                  Text(
                    '  Scan QR',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
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

  final List<Image> carouselImages;
  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: carouselImages.length,
      position: _currentIndex,
      decorator: DotsDecorator(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(
            color: Colors.green,
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
    return DropdownButton(
      hint: const Text(
        'Eng..',
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.white,
        size: 20,
      ),
      items: const [],
      onChanged: (value) {},
    );
  }
}
