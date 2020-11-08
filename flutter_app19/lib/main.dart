/*
controller = AnimationController(
  vsync: this,  // おまじない
  duration: Duration(seconds: 2),
);

animation = Tween<double>(
  begin: 1.0, // アニメーション開始時のスケール
  end: 2.0    // アニメーション終了時のスケール
).animate(controller);

controller.forward(); // アニメーション再生

ScaleTransition(
  scale: animation, // あとはいい感じにやってくれる
  child: Container(
    width:50,
    height: 50,
    color Colors.blue,
  ),
)
 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Test",
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this, // with SingleTickerProviderStateMixin を忘れずに
      duration: Duration(seconds: 2),
    );

    animation = Tween<double>(
      begin: 1.0, // アニメーション開始時のスケール
      end: 2.0, // アニメーション終了時のスケール
    ).animate(controller);
  }

  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () {
                // アニメーション再生
                controller.forward();
              },
            ),
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: () {
                // アニメーション停止
                controller.stop();
              },
            ),
            IconButton(
              icon: Icon(Icons.loop),
              onPressed: () {
                // アニメーション繰り返し
                controller.repeat();
              },
            )
          ],
        ),
      ),
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Container(
            width: 50,
            height: 50,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
