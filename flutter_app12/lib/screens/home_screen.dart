import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app12/widgets/app_bar.dart';
import 'package:flutter_app12/widgets/bottom_bar.dart';
import 'package:flutter_app12/widgets/side_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // デバイス画面サイズ取得
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          _buildHeader(screenHeight),
        ],
      ),
      // bottomNavigationBar: CustomBottomBar(),
      // drawer: CustomSideBar(),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter();
  }
}
