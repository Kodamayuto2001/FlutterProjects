// ファイル、ディレクトリ、ソケット、プロセス、HTTPサーバ、クライアントを操作
import 'dart:io';
// Faceクラスを使うために必要なライブラリ
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
// マテリアルデザインを実装するフラッターウィジェット
import 'package:flutter/material.dart';
// Flutterの画像ライブラリから画像を選択し、カメラで新しい写真を撮るためのiOSおよびAndroid用のFlutterプラグイン
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // このウィジェットは、アプリケーションのroot
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // タイトル
      title: "Face Finder",
      // theme=テーマ　ウィジェットのテーマをここで決める
      // このクラスはアプリケーションのルートなので、アプリケーション全体のテーマをここで決めるということになる
      theme: ThemeData(
        // ThemeData は、primarySwatch　に指定されたカラーパレットを使って、各プロパティを設定
        primarySwatch: Colors.blue,
        // ユーザーインターフェイスコンポーネントの視覚的な密度を定義
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // 最初のページ
      home: FaceFinder(),
    );
  }
}

class FaceFinder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FaceFinderState();
}

class _FaceFinderState extends State<FaceFinder> {
  // ファイル保存用
  File _imageFile;
  // ファイルのサイズ
  Size _imageSize;
  // 顔だけをRectで囲むそれを切り取る保存用変数
  List<Face> _faceResults;

  // Firebase機械学習ビジョンサービスのエントリークラス 例torchvision的な
  // faceDetector　顔検出器
  final FaceDetector _faceDetector = FirebaseVision.instance.faceDetector();
  // カメラを使うときに必要なImagePickerクラスのインスタンス
  final ImagePicker _picker = ImagePicker();

  // ImageSourceでカメラで撮影するのか、それともギャラリーから呼び出すのかをを定義することができる
  // 非同期処理
  void _getImageAndFindFace(ImageSource imageSource) async {
    //状態が変わったことをStatefulWidgetクラスに伝え、画面を更新するための関数
    // 初期化していると考えられる
    setState(() {
      _imageFile = null;
      _imageSize = null;
    });
    // 画像を取得　この関数のimageSource から取得　そして変数に代入
    final PickedFile pickedImage = await _picker.getImage(source: imageSource);
    // 指定したパスpickedImage.path からFileを取得する
    final File imageFile = File(pickedImage.path);

    //もし画像を選択していたら
    if (imageFile != null) {
      // 画像のサイズを取得する関数に引数として代入
      _getImageSize(imageFile);
      // 顔を識別検出する関数に画像が格納されている変数を引数として代入
      _findFace(imageFile);
    }

    // 状態を更新する
    setState(() {
      // 状態を上書きする　画像の
      _imageFile = imageFile;
    });
  }

  // imageFileをもらう関数 画像のサイズを取得する
  void _getImageSize(File imageFile) {
    // Image.file()コンストラクタで初期化した場合、何回カメラ撮影をしてもバックアップされた最初のImageStreamを読み込むため、最初の画像しか表示されなくなる
    // Image.memory imageFile.readAsBytesSync() 最初の画像だけしか表示されない現象の解決につながりそう
    final Image image = Image.file(imageFile);
    // 指定されたを使用してこの画像プロバイダーを解決しconfiguration、ImageStreamを返します
    // ImageStream 画像リソースへのハンドル
    // 新しい具象ImageInfo オブジェクトが利用可能になるたびに呼び出されるリスナーコールバックを追加する。具体的なイメージがすでに利用可能な場合、このオブジェクトはリスナーを同期的に呼び出す
    //ImageInfoオブジェクトは、取得された画像の実際のデータを表すためにImageStreamオブジェクトによって使用
    image.image.resolve(ImageConfiguration()).addListener(
      //画像の読み込みに関する通知を受信するためのインターフェース
      ImageStreamListener((ImageInfo info, bool _) {
        setState(() {
          // Size関数で画像の縦横をdouble型で取得し変数に格納する
          _imageSize = Size(
            info.image.width.toDouble(),
            info.image.height.toDouble(),
          );
        });
      }),
    );
  }

  void _findFace(File imageFile) async {
    setState(() {
      // まず状態を初期化
      _faceResults = null;
    });
    // オンデバイスとクラウドの両方のAPI検出器に使用できる画像オブジェクトを表します
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(imageFile);

    // 非同期処理　フィールド変数　顔検出器 detectInImage()またはprocessImage()
    List<Face> results = await _faceDetector.processImage(visionImage);

    // 状態を更新
    setState(() {
      _faceResults = results;
    });
  }

  Widget _makeImage() {
    return Container(
      // ConstrainedBox は、 BoxConstraints と組み合わせて使うことによって、中の要素の大きさを制限します。 限られた端末の画面内に要素を収めるために非常に重要な要素です。
      // 幅・高さ共に広がるだけ広がる
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.file(_imageFile).image,
          fit: BoxFit.contain,
        ),
      ),
      child: _imageSize == null || _faceResults == null
          ? Center(
              child: Text(
                "Detecting...",
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 32.0,
                ),
              ),
            )
          : CustomPaint(
              painter: FaceBorderDrawer(_imageSize, _faceResults),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // このページの上のバー
      appBar: AppBar(
        title: Text("Face Finder"),
      ),
      // このページの中身
      body: _imageFile == null
          ? Center(
              child: Text("No image selected."),
            )
          : _makeImage(),
      // つい押したくなるボタン
      // Column 列
      // 子を垂直配列して表示させるウィジェット
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end, // メイン方向の終了位置に配置
        children: <Widget>[
          FloatingActionButton(
            // ボタンをおしたら
            onPressed: () {
              // 写真を撮るかギャラリーから取得するかをきめ、フィールド変数に格納する関数 ギャラリーを指定
              _getImageAndFindFace(ImageSource.gallery);
            },
            // ボタンを押すときに表示されるヒントみたいなユーザーに分かりやすいように文章を表示させる
            // 長押しすると表示される
            tooltip: "Select Image",
            // FloatingActionButtonのアイコン　カメラのアイコン
            child: Icon(Icons.add_photo_alternate),
          ),
          // padding = 余白　四方均等に10.0の余白
          Padding(padding: EdgeInsets.all(10.0)),
          FloatingActionButton(
            // 無名関数
            onPressed: () {
              _getImageAndFindFace(ImageSource.camera);
            },
            tooltip: "Take Photo",
            child: Icon(Icons.add_a_photo),
          ),
        ],
      ),
    );
  }

  // 開放が必要な処理
  @override
  void dispose() {
    // faceDetectorをクローズする
    _faceDetector.close();
    super.dispose();
  }
}

// CustomPainter Flutterで円や三角形、四角形を描写する
class FaceBorderDrawer extends CustomPainter {
  final Size originalImageSize;
  final List<Face> faces;

  // コンストラクタ　フィールド変数にアクセスする
  // コンストラクタの略記
  FaceBorderDrawer(this.originalImageSize, this.faces);

  // 必要な関数
  @override
  void paint(Canvas canvas, Size size) {
    final double scale = size.width / originalImageSize.width;
    final double vSpace = (size.height -
            size.width * originalImageSize.height / originalImageSize.width) /
        2.0;

    final Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;
    paint.color = Colors.red;

    for (Face face in faces) {
      canvas.drawRect(
        Rect.fromLTRB(
          face.boundingBox.left * scale,
          face.boundingBox.top * scale + vSpace,
          face.boundingBox.right * scale,
          face.boundingBox.bottom * scale + vSpace,
        ),
        paint,
      );
    }
  }

  // 必要な関数
  @override
  bool shouldRepaint(FaceBorderDrawer oldDelegate) {
    return oldDelegate.originalImageSize != originalImageSize ||
        oldDelegate.faces != faces;
  }
}
