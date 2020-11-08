import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp()); // 引数のWidgetが画面いっぱいに表示される

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 40.0,
        title: Text(
          "home",
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.black,
            //letterSpacing: 10.0,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  return AppBar()
}