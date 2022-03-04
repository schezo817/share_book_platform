import 'package:flutter/material.dart';

import 'package:share_book_platform/all_items.dart';
import 'package:share_book_platform/share_widget/drawer.dart';
import 'package:share_book_platform/share_widget/my_share.dart';

class UsingRecord extends StatefulWidget {
  @override
  _UsingRecordState createState() => _UsingRecordState();
}

class _UsingRecordState extends State<UsingRecord> {
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
        appBar: AppBar(
          title: Text(
            items.elementAt(2),
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
                  'まだ一度も利用していません。',
                ),
                RaisedButton(
                  child: const Text('ホームに戻る'),
                  onPressed: () {
                    //押したら反応するコード
                    MyDrawer.movePage(context, AllItems());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
