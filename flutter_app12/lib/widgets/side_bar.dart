import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app12/config/palette.dart';

class CustomSideBar extends StatefulWidget {
  @override
  _CustomSideBarState createState() => _CustomSideBarState();
}

class _CustomSideBarState extends State<CustomSideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text("ヘッダーです。"),
            decoration: BoxDecoration(
              color: Palette.primaryColor,
            ),
          ),
          ListTile(
            title: Text("アイテムその１"),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("アイテムその２"),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("アイテムその３"),
            trailing: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
