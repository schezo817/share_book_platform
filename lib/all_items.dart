import 'package:flutter/material.dart';

import 'package:share_book_platform/introduce_new_books.dart';
import 'package:share_book_platform/share_widget/my_share.dart';
import 'package:share_book_platform/using_record.dart';
import 'package:share_book_platform/using_register.dart';
import 'package:share_book_platform/config/size_config.dart';
import 'package:share_book_platform/share_widget/drawer.dart';

class AllItems extends StatefulWidget {
  @override
  _AllItemsState createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  static List<String> items = MyDrawer.items();
  static String item0 = items.elementAt(0);
  static String item1 = items.elementAt(1);
  static String item2 = items.elementAt(2);

  @override
  Widget build(BuildContext context) {
    //画面サイズ管理
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        drawer: Drawer(
          child: MyDrawer.myDrawer(context),
        ),
        appBar: AppBar(
          title: const Text(
            '共同保有の森',
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
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal! * 50,
                        height: SizeConfig.blockSizeHorizontal! * 50,
                        padding: const EdgeInsets.all(4),
                        child: ElevatedButton(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              item1,
                              style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal! * 10,
                              ),
                            ),
                          ),
                          onPressed: () {
                            MyDrawer.movePage(context, IntroductNewBooks());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal! * 50,
                        height: SizeConfig.blockSizeHorizontal! * 50,
                        padding: const EdgeInsets.all(4),
                        child: ElevatedButton(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              item0,
                              style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal! * 10,
                              ),
                            ),
                          ),
                          onPressed: () {
                            MyDrawer.movePage(context, UsingRegister());
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal! * 50,
                        height: SizeConfig.blockSizeHorizontal! * 50,
                        padding: const EdgeInsets.all(4),
                        child: ElevatedButton(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              item2,
                              style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal! * 10,
                              ),
                            ),
                          ),
                          onPressed: () {
                            MyDrawer.movePage(context, UsingRecord());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyDrawer.myBottomNavigationBar(context, 0),
      ),
    );
  }
}
