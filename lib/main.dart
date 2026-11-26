import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telebirrbybr7/colors.dart';
import 'package:telebirrbybr7/screens/main_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'telebirr',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F6F8),
        colorScheme: ColorScheme.fromSeed(
          seedColor: mainColor,
          primary: mainColor,
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
