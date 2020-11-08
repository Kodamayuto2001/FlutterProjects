// マテリアルデザインを実装するフラッターウィジェット
import 'package:flutter/material.dart';
// Flutterの画像ライブラリから画像を選択し、カメラで新しい写真を撮るためのiOSおよびAndroid用のFlutterプラグイン
import 'package:image_picker/image_picker.dart';
// ファイル、ディレクトリ、ソケット、プロセス、HTTPサーバ、クライアントを操作
import 'dart:io';

void main() {
  // runApp内で実行
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // @overrideで親クラスのWidget型のbuild関数を子のクラスで書き直す
  @override
  Widget build(BuildContext context) {
    // アプリをマテリアルデザインで設計する
    return MaterialApp(
      home: HomePage(),
    );
  }
}

// 状態が変わるウィジェットはStatefulWidgetで下記のようにする(暗記)
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ファイル保存用
  File _image;
  // カメラを使うときに必要なImagePickerクラスのインスタンス
  final picker = ImagePicker();

  // 非同期処理 Future 名前 async{}
  Future getImageFromCamera() async {
    // カメラから画像を取得 非同期処理する部分
    final PickedFile = await picker.getImage(source: ImageSource.camera);

    // 状態が変わったことをStatefulWidgetクラスに伝え、画面を更新するための関数
    setState(() {
      // setStateの引数
      _image = File(PickedFile.path);
    });
  }

  // ギャラリーから画像を取得 非同期で
  Future getImageFromGallery() async {
    // ギャラリーから画像を取得
    final PickedFile = await picker.getImage(source: ImageSource.gallery);

    // 状態を更新
    setState(() {
      // 変数に格納
      _image = File(PickedFile.path);
    });
  }

  // build関数を書かないとerror 親クラスの影響
  @override
  Widget build(BuildContext context) {
    // Scaffoldが返されることでUIが成り立つ
    // UIの作成はScaffoldの中で行う
    return Scaffold(
      // アプリの上部にあるバー
      appBar: AppBar(
        //タイトル Textクラスの必ず要る引数 "hoge"
        title: Text("test"),
      ),
      // body=中身 Center=子要素の横または縦を真ん中に位置させる為のWidget
      body: Center(
        // 真ん中の列 Column=縦方向
        child: Column(
          //Columnの場合 mainAxisAlignment=垂直方向 crossAxisAlignment=水平方向
          // crossなのでColumn=縦方向とcross(交差)する方向 
          crossAxisAlignment: CrossAxisAlignment.center,
          // 子要素
          children: [
            // 余白を作るためのウィジェット
            Padding(
              // EdgeInsetsを使うことでパディングをもたせることができる。intではない
              padding: const EdgeInsets.all(8.0),
              // コンテナ化する　領域をもたせる
              child: Container(
                // 幅
                width: 300,
                // なぜここで分かりにくい三項演算子があるのか　
                // なぜなら、child: 以降は　引数だから
                // void f(int if(){}else(){}){}
                // ↑こんなえげつないことはしてはいけない
                child: _image == null ? Text("No image selected") : Image.file(_image),
              ),
            ),
            // 行
            Row(
              // Row=横方向 mainAxiAlignmentは、親=Rowと同じ方向に進む
              // 並べた子の間に空きスペースを均等に配置する
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // 子要素
              children: [
                // 丸いボタン
                // ユーザーがつい押したくなるようなボタン
                // 最も独特なボタン
                // ユーザーにアクションを促すボタン
                FloatingActionButton( 
                  // ユーザーがつい押してしまったら
                  // 写真を取得
                  onPressed: getImageFromCamera,
                  // Tooltipとはアイコン等を長押しした際に表示されるテキストメッセージのこと
                  // Tooltipがあると、アイコン等の意味がユーザーに伝わりやすくなる（アクセシビリティが向上する）
                  //音声読み上げにも対応しており、目の不自由な方にも優しい
                  tooltip: "Pick Image From Camera",
                  // Iconクラス
                  child: Icon(Icons.add_a_photo),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
