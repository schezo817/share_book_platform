import 'package:flutter/material.dart';

import 'package:share/share.dart';
import 'package:share_book_platform/main.dart';
import 'package:share_book_platform/share_widget/drawer.dart';
import 'package:share_book_platform/share_widget/my_share.dart';

class CompleteFirstRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '共同保有の森',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            MyShare.myShare(),
          ],
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              const Text(
                '登録が完了しました！',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              RaisedButton(
                child: const Text('ホームに戻る'),
                onPressed: () {
                  //押したら反応するコード
                  MyDrawer.movePage(context, const MyHomePage(title: '共同保有の森ログインフォーム'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
