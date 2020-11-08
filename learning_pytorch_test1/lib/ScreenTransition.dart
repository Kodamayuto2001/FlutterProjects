/* 4-1. 画面遷移 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(name: "Main",nextPageName: "Sub1",),
      routes: <String,WidgetBuilder> {
        "/Sub1": (BuildContext context) => SubPage(name: "Sub1",nextPageName: "Sub2",),// サブ1
        "/Sub2": (BuildContext context) => SubPage(name: "Sub2",nextPageName: ""),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  // メンバ変数
  String name;
  String nextName;
  String nextPage;

  // コンストラクタ
  MainPage({String name,String nextPageName}) {
    this.name = name;
    this.nextName = nextPageName;
    this.nextPage = "/" + this.nextName;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.name+"ページ"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(this.name),
              RaisedButton( // 立体的なボタン
                onPressed: () => Navigator.of(context).pushNamed(this.nextPage),
                child: Text(this.nextName+"へ"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SubPage extends StatelessWidget {
  // メンバ変数
  String name;
  String nextName;
  String nextPage;

  // コンストラクタ
  SubPage({String name,String nextPageName}) {
    this.name = name;
    this.nextName = nextPageName;
    this.nextPage = "/" + this.nextName;
  }

  dynamic mRaisedButton({context}) {
    return RaisedButton(
      onPressed: () => Navigator.of(context).pushNamed(this.nextPage),
      child: Text(this.nextName+"へ"),
    );
  }

  dynamic mColumn({context}) {
    if(this.nextName==""){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(this.name),
        ],
      );
    }else{
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(this.name),
          mRaisedButton(context: context),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.name),
      ),
      body: Container(
        child: Center(
          child: mColumn(context: context),
        ),
      ),
    );
  }
}















