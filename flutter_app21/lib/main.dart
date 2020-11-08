import 'package:flutter/material.dart';

void main() {
  runApp(MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Todo App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoListPage(),
    );
  }
}

// class TodoListPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // AppBarを表示し、タイトルも設定
//       appBar: AppBar(
//         title: Text("リスト一覧"),
//       ),
//       body: ListView(
//         children: <Widget>[
//           Card(
//             child: ListTile(
//               title: Text("ニンジンを買う"),
//             ),
//           ),
//           Card(
//             child: ListTile(
//               title: Text("玉ねぎを買う"),
//             ),
//           ),
//           Card(
//             child: ListTile(
//               title: Text("ジャガイモを買う"),
//             ),
//           ),
//           Card(
//             child: ListTile(
//               title: Text("カレールーを買う"),
//             ),
//           ),
//         ],
//       ),

//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           // "push" で新規画面に遷移
//           // リスト追加画面から渡される値を受け取る
//           final newListText = await Navigator.of(context).push(
//             MaterialPageRoute(builder: (context) {
//               // 遷移先の画面としてリスト追加画面を指定
//               return TodoAddPage();
//             }),
//           );
//           if (newListText != null) {
//             // キャンセルした場合は newListTextがnullとなるので注意
//           }
//           Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//             // 遷移先の画面としてリスト追加画面を指定
//             return TodoAddPage();
//           }));
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// リスト一覧画面用Widget
class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  // Todo リストのデータ
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBarを表示し、タイトルも設定
      appBar: AppBar(
        title: Text("リスト一覧"),
      ),
      // データをもとにListViewを作成
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(todoList[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // "push"で新規画面に遷移
          // リスト追加画面～渡される値を受け取る
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return TodoAddPage();
            }),
          );
          if (newListText != null) {
            // キャンセルした場合はnewListTextがnullとなるので注意
            setState(() {
              // リストを追加
              todoList.add(newListText);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  // 入力されたテキストデータとして持つ
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("リスト追加"),
      ),
      // body: Center(
      //   child: FlatButton(
      //     // ボタンをクリックしたときの処理
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //     child: Text("リスト追加画面 (クリックで戻る) "),
      //   ),
      // ),
      body: Container(
        // 余白を付ける
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // テキスト入力
            TextField(
              // 入力されたテキストの値を受け取る (valueが入力されたテキスト)
              onChanged: (String value) {
                // データが変更したことを知らせる (画面を更新する)
                setState(() {
                  // データを変更
                  _text = value;
                });
              },
            ),
            Container(
              // 横幅いっぱいに広げる
              width: double.infinity,
              // リスト追加ボタン
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  // "pop"で前の画面に戻る
                  // "pop"の引数から前の画面にデータを渡す
                  Navigator.of(context).pop(_text);
                },
                child: Text(
                  "リスト追加",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              // 横幅いっぱいに広げる
              width: double.infinity,
              // キャンセルボタン
              child: FlatButton(
                onPressed: () {
                  // "pop"で前の画面に戻る
                  Navigator.of(context).pop();
                },
                child: Text("キャンセル"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
