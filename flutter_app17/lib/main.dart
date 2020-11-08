import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animation test",
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  double size = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            size = 200;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: size,
          height: size,
          color: Colors.blue,
        ),
      ),
    );
  }
}
