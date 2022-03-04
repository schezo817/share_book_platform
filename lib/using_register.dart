import 'package:flutter/material.dart';

import 'package:share_book_platform/all_items.dart';
import 'package:share_book_platform/complete_using_register.dart';
import 'package:share_book_platform/share_widget/drawer.dart';
import 'package:share_book_platform/share_widget/my_share.dart';

class UsingRegister extends StatefulWidget {
  @override
  _UsingRegisterState createState() => _UsingRegisterState();
}

class _UsingRegisterState extends State<UsingRegister> {
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
            items.elementAt(0),
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
                RaisedButton(
                  child: const Text('確定'),
                  onPressed: () {
                    //押したら反応するコード
                    MyDrawer.movePage(context, CompleteUsingRegister());
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
