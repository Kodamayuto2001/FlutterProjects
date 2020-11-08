import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // rootBundle
import 'package:image/image.dart' as imgLib; // <- Dart Image Library
import 'dart:typed_data'; // Uint8List

void main() => runApp(MyApp());

// MyApp ウィジェットクラス
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: MyHomePage(title: 'Dart Image Library'),
    );
  }
}

// MyHomePage ウィジェットクラス
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// MyHomePage ステートクラス
class _MyHomePageState extends State<MyHomePage> {
  imgLib.Image _image;
  List<int> _imageBytes;

  // アセットから画像を読み込む関数
  void loadAssetImage() async {
    ByteData imageData = await rootBundle.load('images/len_std.jpg');
    _image = imgLib.decodeImage(Uint8List.view(imageData.buffer));
    _imageBytes = imgLib.encodeJpg(_image);
    setState(() {});
  }

  // 初期化
  @override
  void initState() {
    // 初期ダミー画像作成
    _image = imgLib.Image(250, 250);
    _imageBytes = imgLib.encodeJpg(_image);

    // アセットから画像を読み込む
    loadAssetImage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('オリジナル画像'),
            SizedBox(
                width: 250,
                height: 250,
                child: Image.asset('images/len_std.jpg')),
            SizedBox(height: 30),
            Text('フィルター画像'),
            SizedBox(width: 250, height: 250, child: Image.memory(_imageBytes)),
            RaisedButton(
              child: Text('フィルター'),
              onPressed: () {
                var image = _image.clone();
                // ----- フィルター処理テスト
                imgLib.vignette(image);
                imgLib.gaussianBlur(image, 5);
                imgLib.grayscale(image);
                // -----
                _imageBytes = imgLib.encodeJpg(image);
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
