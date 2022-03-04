import 'package:flutter/material.dart';

import 'package:share_book_platform/all_items.dart';
import 'package:share_book_platform/share_widget/drawer.dart';
import 'package:share_book_platform/share_widget/my_share.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  static List<String> items = MyDrawer.items();

  @override
  Widget build(BuildContext context) {
    //web,Android上の戻るボタン
    return WillPopScope(
      onWillPop: () async {
        //押したら反応するコード
        return await MyDrawer.movePage(context, AllItems());
      },
      child: Scaffold(
        drawer: Drawer(
          child: MyDrawer.myDrawer(context),
        ),
        appBar: AppBar(
          title: Text(
            items.elementAt(4),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
          //共有(share)のボタン
          actions: [
            MyShare.myShare(),
          ],
        ),
        bottomNavigationBar: MyDrawer.myBottomNavigationBar(context, 3),
      ),
    );
  }
}
