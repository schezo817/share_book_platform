import 'package:flutter/material.dart';

import 'package:share_book_platform/all_items.dart';
import 'package:share_book_platform/share_widget/drawer.dart';
import 'package:share_book_platform/share_widget/my_share.dart';

class InformFromOperation extends StatefulWidget {
  @override
  _InformFromOperationState createState() => _InformFromOperationState();
}

class _InformFromOperationState extends State<InformFromOperation> {
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
            items.elementAt(3),
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
        body: Container(
          width: double.infinity,
          //画面端の余白
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Text(
                  '現在お知らせはありません。',
                ),
                RaisedButton(
                  child: const Text('ホームに戻る'),
                  onPressed: () {
                    MyDrawer.movePage(context, AllItems());
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyDrawer.myBottomNavigationBar(context, 1),
      ),
    );
  }
}
