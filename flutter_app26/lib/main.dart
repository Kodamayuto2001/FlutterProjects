import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Palette {
  static const Color kAccentColor = Color(0xFFFE7C64);
  static const Color kBackgroundColor = Color(0xFF19283D);
  static const Color kTextColorPrimary = Color(0xFFECEFF1);
  static const Color kTextColorSecondary = Color(0xFFB0BEC5);
  static const Color kButtonColorPrimary = Color(0xFFECEFF1);
  static const Color kButtonTextColorPrimary = Color(0xFF455A64);
  static const Color kIconColor = Color(0xFF455A64);

  static const MaterialColor customSwatch_main = MaterialColor(
    _color1,
    <int, Color>{
      50: Color(0xFFE2E2E6),
      100: Color(0xFFB8B7C2),
      200: Color(0xFF888899),
      300: Color(0xFF585870),
      400: Color(0xFF353451),
      500: Color(_color1),
      600: Color(0xFF0F0E2D),
      700: Color(0xFF0C0C26),
      800: Color(0xFF0A091F),
      900: Color(0xFF050513),
    },
  );
  static const int _color1 = 0xFF111032;

  static const MaterialColor customSwatch_base =
      MaterialColor(_color2, <int, Color>{
    50: Color(0xFFE8E8EE),
    100: Color(0xFFC5C5D4),
    200: Color(0xFF9F9EB8),
    300: Color(0xFF78779C),
    400: Color(0xFF5B5986),
    500: Color(_color2),
    600: Color(0xFF383669),
    700: Color(0xFF302E5E),
    800: Color(0xFF282754),
    900: Color(0xFF1B1A42),
  });
  static const int _color2 = 0xFF3E3C71;

  static const MaterialColor customSwatch_accent =
      MaterialColor(_color3, <int, Color>{
    50: Color(0xFFF0F0F6),
    100: Color(0xFFDADAE8),
    200: Color(0xFFC2C1D8),
    300: Color(0xFFAAA8C8),
    400: Color(0xFF9796BD),
    500: Color(_color3),
    600: Color(0xFF7D7BAA),
    700: Color(0xFF7270A1),
    800: Color(0xFF686698),
    900: Color(0xFF555388),
  });
  static const int _color3 = 0xFF8583B1;

  static const MaterialColor strongPurple = MaterialColor(_color4, <int, Color>{
    50: Color(0xFFEDE5F4),
    100: Color(0xFFD1BFE3),
    200: Color(0xFFB394D1),
    300: Color(0xFF9469BF),
    400: Color(0xFF7D49B1),
    500: Color(_color4),
    600: Color(0xFF5E249B),
    700: Color(0xFF531F91),
    800: Color(0xFF491988),
    900: Color(0xFF380F77),
  });
  static const int _color4 = 0xFF6629A3;

  static const MaterialColor brightLightBlue =
      MaterialColor(_color5, <int, Color>{
    50: Color(0xFFE0F9F4),
    100: Color(0xFFB3F1E3),
    200: Color(0xFF80E7D1),
    300: Color(0xFF4DDDBF),
    400: Color(0xFF26D6B1),
    500: Color(_color5),
    600: Color(0xFF00CA9B),
    700: Color(0xFF00C391),
    800: Color(0xFF00BD88),
    900: Color(0xFF00B277),
  });
  static const int _color5 = 0xFF00CFA3;

  static const MaterialColor brightRed = MaterialColor(_color6, <int, Color>{
    50: Color(0xFFFFE8EE),
    100: Color(0xFFFFC6D4),
    200: Color(0xFFFFA1B7),
    300: Color(0xFFFF7B9A),
    400: Color(0xFFFF5E84),
    500: Color(_color6),
    600: Color(0xFFFF3C66),
    700: Color(0xFFFF335B),
    800: Color(0xFFFF2B51),
    900: Color(0xFFFF1D3F),
  });
  static const int _color6 = 0xFFFF426E;

  static const MaterialColor brightOrange = MaterialColor(_color7, <int, Color>{
    50: Color(0xFFFFF1EA),
    100: Color(0xFFFFDDCA),
    200: Color(0xFFFFC6A7),
    300: Color(0xFFFFAF84),
    400: Color(0xFFFF9E69),
    500: Color(_color7),
    600: Color(0xFFFF8548),
    700: Color(0xFFFF7A3F),
    800: Color(0xFFFF7036),
    900: Color(0xFFFF5D26),
  });
  static const int _color7 = 0xFFFF8D4F;

  static const MaterialColor purple_main = MaterialColor(_color8, <int, Color>{
    50: Color(0xFFE8E7F4),
    100: Color(0xFFC5C2E3),
    200: Color(0xFF9F99D0),
    300: Color(0xFF7870BD),
    400: Color(0xFF5B52AE),
    500: Color(_color8),
    600: Color(0xFF382E98),
    700: Color(0xFF30278E),
    800: Color(0xFF282084),
    900: Color(0xFF1B1473),
  });
  static const int _color8 = 0xFF3E33A0;

  static const MaterialColor purple_accent =
      MaterialColor(_color9, <int, Color>{
    50: Color(0xFFE7E2F0),
    100: Color(0xFFC3B6D9),
    200: Color(0xFF9B86C0),
    300: Color(0xFF7355A6),
    400: Color(0xFF553093),
    500: Color(_color9),
    600: Color(0xFF310A78),
    700: Color(0xFF2A086D),
    800: Color(0xFF230663),
    900: Color(0xFF160350),
  });
  static const int _color9 = 0xFF370C80;

  static const MaterialColor bluePurple = MaterialColor(_color10, <int, Color>{
    50: Color(0xFFE3E0E8),
    100: Color(0xFFB8B3C5),
    200: Color(0xFF89809E),
    300: Color(0xFF594D77),
    400: Color(0xFF36265A),
    500: Color(_color10),
    600: Color(0xFF100037),
    700: Color(0xFF0D002F),
    800: Color(0xFF0A0027),
    900: Color(0xFF05001A),
  });
  static const int _color10 = 0xFF12003D;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       _Header(),
        //       _Body(),
        //       _Footer(),
        //     ],
        //   ),
        // ),
        child: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: <Widget>[
            // _Header(),
            // _Body(),
            // _Footer(),
            SliverToBoxAdapter(
              child: _Header(),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      //..lineTo(0, size.height * 0.5)
      ..lineTo(0, size.height * 0.6)
      ..quadraticBezierTo(
        // size.width * 0.55,
        size.width * 0.4,
        size.height,
        size.width,
        // size.height * 0.6,
        size.height * 0.4,
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _HeaderBackground extends StatelessWidget {
  final double height;

  const _HeaderBackground({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _HeaderCurveClipper(),
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          colors: [
            Palette.customSwatch_main,
            Palette.customSwatch_base,
          ],
          stops: [0, 1],
        )),
      ),
    );
  }
}

class _HeaderCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final paint1 = Paint()
      ..color = Palette.strongPurple.withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    final paint2 = Paint()
      ..color = Palette.brightLightBlue.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final paint3 = Paint()
      ..color = Palette.brightRed.withOpacity(0.35)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    final paint4 = Paint()
      ..color = Palette.brightOrange.withOpacity(0.45)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final paint5 = Paint()
      ..color = Palette.brightLightBlue.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final paint6 = Paint()
      ..color = Palette.kAccentColor.withAlpha(60)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawCircle(
      Offset(size.width * 0.25, size.height * 0.4),
      1,
      paint2,
    );
    canvas.drawCircle(
      Offset(size.width * 0.75, size.height * 0.2),
      2,
      paint1,
    );

    canvas.drawCircle(
      Offset(size.width * 0.45, size.height * 0.3),
      1,
      paint3,
    );

    canvas.drawCircle(
      Offset(size.width * 0.12, size.height * 0.22),
      1,
      paint4,
    );

    canvas.drawCircle(
      Offset(size.width * 0.31, size.height * 0.17),
      2,
      paint1,
    );

    canvas.drawCircle(
      Offset(size.width * 0.31, size.height * 0.17),
      1,
      paint2,
    );

    canvas.drawCircle(
      Offset(size.width * 0.67, size.height * 0.29),
      1,
      paint5,
    );

    canvas.drawLine(
      Offset(size.width * 0.66, size.height * 0.28),
      Offset(size.width * 0.68, size.height * 0.30),
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.93, size.height * 0.18),
      3,
      paint6,
    );

    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.8),
      1,
      paint1,
    );

    canvas.drawCircle(
      Offset(size.width * 0.75, size.height * 0.75),
      1,
      paint2,
    );

    canvas.drawCircle(
      Offset(size.width * 0.93, size.height * 0.6),
      1,
      paint4,
    );

    canvas.drawCircle(
      Offset(size.width * 0.3, size.height * 0.72),
      1,
      paint5,
    );

    canvas.drawCircle(
      Offset(size.width * 0.23, size.height * 0.68),
      1,
      paint1,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _HeaderCircles extends StatelessWidget {
  final double height;

  const _HeaderCircles({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HeaderCirclePainter(),
      child: Container(
        width: double.infinity,
        height: height,
      ),
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Please control the car body",
          style: Theme.of(context).textTheme.headline4.copyWith(
                color: Palette.kTextColorPrimary,
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "サーバーを通してRaspberry Piの車をコントロールします。",
          style: Theme.of(context)
              .textTheme
              .subtitle2
              .copyWith(color: Palette.kTextColorPrimary),
        ),
      ],
    );
  }
}

class _HeaderBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.transparent,
      shape: CircleBorder(
        side: BorderSide(color: Colors.white),
      ),
      onPressed: () {},
      child: Icon(
        Icons.chevron_left,
        color: Palette.kIconColor,
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = 750;
    return Container(
      height: height,
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: _HeaderBackgroundBottom(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _HeaderBackground(
              height: height,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _HeaderCircles(
              height: height,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 128),
              child: _HeaderTitle(),
            ),
          ),
          Positioned(
            top: 16,
            left: 0,
            child: _HeaderBackButton(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Controller(),
          ),
        ],
      ),
    );
  }
}

class _HeaderBackgroundBottom extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     decoration: BoxDecoration(
  //         gradient: LinearGradient(
  //       begin: FractionalOffset.topCenter,
  //       end: FractionalOffset.bottomCenter,
  //       colors: [
  //         Palette.bluePurple[400],
  //         Palette.customSwatch_main[700],
  //       ],
  //       stops: [0, 1],
  //     )),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _HeaderCurveClipperBottom(),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Palette.bluePurple[400],
            Palette.customSwatch_main[700],
          ],
          stops: [0, 1],
        )),
      ),
    );
  }
}

class _HeaderCurveClipperBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // カスケード記述
    return Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.55, size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Controller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        // color: Palette.bluePurple,
        color: Colors.orange,
        width: 500.0,
        height: 500.0,
        child: Center(
          child: Drag_and_Drop(),
        ),
      ),
    );
  }
}

class Drag_and_Drop extends StatefulWidget {
  @override
  _Drag_and_Drop_State createState() => _Drag_and_Drop_State();
}

class _Drag_and_Drop_State extends State<Drag_and_Drop> {
  @override
  Widget build(BuildContext context) {
    return buildDraggable("Draggable", Icons.filter_1);
  }

  Draggable buildDraggable(String name, IconData childIcon) => new Draggable(
        child: Container(
          height: 10,
          width: 10,
          color: Colors.blue,
        ),
        // feedback: Icon(
        //   Icons.android,
        //   size: 90,
        // ),
        feedback: Container(
          height: 10,
          width: 10,
          color: Palette.bluePurple,
        ),
        // childWhenDragging: Icon(
        //   Icons.flag,
        //   size: 90,
        // ),
      );
}

// class _Footer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       color: Colors.white,
//     );
//   }
// }
