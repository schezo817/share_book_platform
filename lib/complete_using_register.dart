import 'package:flutter/material.dart';

import 'package:share_book_platform/all_items.dart';
import 'package:share_book_platform/share_widget/drawer.dart';
import 'package:share_book_platform/share_widget/my_share.dart';

class CompleteUsingRegister extends StatefulWidget {
  @override
  _CompleteUsingRegisterState createState() => _CompleteUsingRegisterState();
}

class _CompleteUsingRegisterState extends State<CompleteUsingRegister> {
  @override
  Widget build(BuildContext context) {
    //web,Android上の戻るボタン
    return WillPopScope(
      onWillPop: () async {
        //押したら反応するコード
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '利用登録完了',
            style: TextStyle(
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
                  '利用登録が完了しました。',
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
