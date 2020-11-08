import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app12/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const MaterialColor customSwatch = MaterialColor(
    _mcgpalette0PrimaryValue,
    <int, Color>{
      50: Color(0xFFE2E2E6),
      100: Color(0xFFB8B7C2),
      200: Color(0xFF888899),
      300: Color(0xFF585870),
      400: Color(0xFF353451),
      500: Color(_mcgpalette0PrimaryValue),
      600: Color(0xFF0F0E2D),
      700: Color(0xFF0C0C26),
      800: Color(0xFF0A091F),
      900: Color(0xFF050513),
    },
  );
  static const int _mcgpalette0PrimaryValue = 0xFF111032;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "数学のアプリ",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: customSwatch,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
