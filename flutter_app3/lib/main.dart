/* exercise3 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Simple App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Live!人工知能"),
        ),
        body: Center(
          child: MyForm(),
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  int _count = 0;

  void _increase() {
    setState(() { // 状態を保持する変数を変更する処理は、setState内に記述する
      _count++;
    });
  }

  void _decreace() {
    setState(() {
      _count--;
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "$_count",
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 30.0,
            ),
          ),
          FlatButton(
            onPressed: _increase,
            color: Colors.blue,
            child: Text(
              "いいね！",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
              ),
            ),
          ),
          FlatButton(
            onPressed: _decreace,
            color: Colors.red,
            child: Text(
              "やだね！",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
              ),
            ),
          )
        ],
      ),
    );
  }
}