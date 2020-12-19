import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draggable Test',
      home: GamePlay(),
    );
  }
}

class GamePlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Row(
            children: [
              Container(
                width: 360,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  border: Border.all(
                    color: Colors.green,
                    width: 2.0,
                  ),
                ),
              ),
              Container(
                width: 190,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.purple,
                    width: 2.0,
                  ),
                ),
              ),
            ],
          ),
          DragObject(
              key: GlobalKey(),
              initPos: Offset(365, 0.0),
              id: 'Item 1',
              itmColor: Colors.orange),
          DragObject(
            key: GlobalKey(),
            initPos: Offset(450, 0.0),
            id: 'Item 2',
            itmColor: Colors.pink,
          ),
        ],
      ),
    );
  }
}

class DragObject extends StatefulWidget {
  final String id;
  final Offset initPos;
  final Color itmColor;

  DragObject({Key key, this.id, this.initPos, this.itmColor}) : super(key: key);

  @override
  _DragObjectState createState() => _DragObjectState();
}

class _DragObjectState extends State<DragObject> {
  GlobalKey _key;
  Offset position;
  Offset posOffset = Offset(0.0, 0.0);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    _key = widget.key;
    position = widget.initPos;
    super.initState();
  }

  void _getRenderOffsets() {
    final RenderBox renderBoxWidget = _key.currentContext.findRenderObject();
    final offset = renderBoxWidget.localToGlobal(Offset.zero);

    posOffset = offset - position;
  }

  void _afterLayout(_) {
    _getRenderOffsets();
  }

  void limitBoundaries(PointerEvent details) {
    if (details.position.dx < 0) {
      print(details.position);
      setState(() {
        position = Offset(0.0, position.dy);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Listener(
        onPointerMove: limitBoundaries,
        child: Draggable(
          child: Container(
            width: 80,
            height: 80,
            color: widget.itmColor,
          ),
          feedback: Container(
            width: 82,
            height: 82,
            color: widget.itmColor,
          ),
          childWhenDragging: Container(),
          onDragEnd: (drag) {
            setState(() {
              position = drag.offset - posOffset;
            });
          },
        ),
      ),
    );
  }
}
