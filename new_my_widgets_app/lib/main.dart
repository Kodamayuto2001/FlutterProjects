/* 2-1. Container */

import 'package:flutter/material.dart';

void main() => runApp(En2());

class MyApp2_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Simple App",
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.blue,
              width: 300.0,
              height: 300.0,
              child: Text("Live!人工知能"),
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}

class MyApp2_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Simple App",
      home: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // 中央に配置（他にstart,end,spaceAroundなど）
          children: <Widget>[
            Column( // 列
              mainAxisAlignment: MainAxisAlignment.center, // 中央に配置
              children: <Widget>[
                Container(color: Colors.blue,width: 100,height: 100,),
                Container(color: Colors.red,width: 100,height: 100,),
                Container(color: Colors.yellow,width: 100,height: 100,),
              ],
            ),
            Column( // 列
              mainAxisAlignment: MainAxisAlignment.center, // 中央に配置
              children: <Widget>[
                Container(color: Colors.green,width: 100,height: 100,),
                Container(color: Colors.orange,width: 100,height: 100,),
                Container(color: Colors.white,width: 100,height: 100,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp2_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Simple App",
      home: Container(
        child: Row(
          children: <Widget>[
            Expanded( // 引き延ばして表示
              flex: 1,
                child: Container(color: Colors.red,),
            ),
            Expanded(
              flex: 2,
                child: Container(color: Colors.green,)
            ),
            Expanded(
              child: Container(color: Colors.blue,),
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp2_4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Simple App"),
        ),
        body: Stack( // 重ねて表示
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 200,
              color: Colors.green,
            ),
            Container(
              width: 50,
              height: 70,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}

class En2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "演習2",
      home: Container(
        child: Row( // 行
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(color: Colors.red,width: 100,height: 100,),
                Container(color: Colors.green,width: 100,height: 100,),
                Container(color: Colors.blue,width: 100,height: 100,),
                Container(color: Colors.yellow,width: 100,height: 100,),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(color: Colors.red,width: 100,height: 100,),
                Container(color: Colors.green,width: 100,height: 100,),
                Container(color: Colors.blue,width: 100,height: 100,),
                Container(color: Colors.yellow,width: 100,height: 100,),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(color: Colors.red,width: 100,height: 100,),
                Container(color: Colors.green,width: 100,height: 100,),
                Container(color: Colors.blue,width: 100,height: 100,),
                Container(color: Colors.yellow,width: 100,height: 100,),
              ],
            )
          ],
        ),
      ),
    );
  }
}


