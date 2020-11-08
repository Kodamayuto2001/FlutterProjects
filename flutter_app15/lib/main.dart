import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Palette {
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
}

const Color kAccentColor = Color(0xFFFE7C64);
const Color kBackgroundColor = Color(0xFF19283D);
const Color kTextColorPrimary = Color(0xFFECEFF1);
const Color kTextColorSecondary = Color(0xFFB0BEC5);
const Color kButtonColorPrimary = Color(0xFFECEFF1);
const Color kButtonTextColorPrimary = Color(0xFF455A64);
const Color kIconColor = Color(0xFF455A64);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // color: Palette.strongPurple.shade50,
      title: "KoSmos",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Palette.customSwatch_main,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double posx = 100.0;
  double posy = 100.0;
  void onTapDown(BuildContext context, TapDownDetails details) {
    print("${details.globalPosition}");
    final RenderBox box = context.findRenderObject();
    final Offset localOffset = box.globalToLocal(details.globalPosition);
    setState(() {
      posx = localOffset.dx;
      posy = localOffset.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) => onTapDown(context, details),
      child: Stack(
        children: <Widget>[
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _Header(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: _Body(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 64),
                    child: _Footer(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: Text("test"),
            left: posx,
            top: posy,
          ),
        ],
      ),
    );
  }
}

class _HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      //..lineTo(0, size.height * 0.5)
      ..quadraticBezierTo(
        // size.width * 0.55,
        0,
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
          "Welcome",
          style: Theme.of(context).textTheme.headline4.copyWith(
                color: kTextColorPrimary,
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Sign in to continue",
          style: Theme.of(context)
              .textTheme
              .subtitle2
              .copyWith(color: kTextColorPrimary),
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
        color: kIconColor,
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = 320;
    return Container(
      height: height,
      child: Stack(
        children: [
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
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      color: Colors.green,
    );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Palette.customSwatch_accent,
    );
  }
}
