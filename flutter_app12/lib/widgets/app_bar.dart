import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app12/config/palette.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primaryColor,
      elevation: 0.0, // 土台と同じ高さ＝つまり土台
      leading: IconButton(
        icon: const Icon(Icons.menu),
        iconSize: 28.0,
        onPressed: () {},
      ),
      actions: <Widget>[
        // IconButton(
        //   icon: const Icon(
        //     Icons.attach_money,
        //     color: Colors.yellowAccent,
        //   ),
        //   iconSize: 28.0,
        //   onPressed: () {},
        // ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
