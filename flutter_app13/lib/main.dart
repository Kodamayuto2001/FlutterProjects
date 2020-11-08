import 'package:flutter/material.dart';

const Color kBackgroundColor = Color(0xFF19283D);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      // デバイスの端にコンテンツを表示し、ユーザーがクリックできないなど、はハードウェアから考えて、ウェジェットを適切なコンテンツ領域に表示することができる。困ったら、SafeAreaを使う
      body: SafeArea(
        // SafeAreaは赤色で表示
        // child: Container(
        //   color: Colors.red,
        // ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _Header(),
              _SingInForm(),
              _Footer(),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 32),
              //   child: _SingInForm(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ----- ヘッダー関連 ----- */

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // color: Colors.blue,
      // child: ClipPath(
      //   clipper: _ClipPathTest(),
      // ),
      child: ClipPath(
        clipper: _ClipPathTest(),
        child: Container(
          height: 200,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class _ClipPathTest extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

/* ----- SignInフォーム関連 ----- */
class _SingInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      color: Colors.green,
    );
  }
}

/* ----- フッター関連 ----- */
class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.orange,
    );
  }
}
