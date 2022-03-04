import 'package:flutter/material.dart';

import 'package:share_book_platform/all_items.dart';
import 'package:share_book_platform/config/size_config.dart';
import 'package:share_book_platform/share_widget/drawer.dart';
import 'package:share_book_platform/share_widget/my_share.dart';

class SearchBookCollection extends StatefulWidget {
  @override
  _SearchBookCollectionState createState() => _SearchBookCollectionState();
}

class _SearchBookCollectionState extends State<SearchBookCollection> {
  static List<String> items = MyDrawer.items();

  final searchWordController = TextEditingController();
  String _searchWord = '';

  @override
  void dispose() {
    searchWordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //画面サイズ管理
    SizeConfig().init(context);
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
            items.elementAt(5),
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
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! *75,
                  child: TextFormField(
                    controller: searchWordController,
                    decoration: const InputDecoration(
                      hintText: 'please book title',
                      labelText: '書籍名',
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 15,
                  child: RaisedButton(
                    child: const Icon(
                      Icons.search,
                    ),
                    onPressed: () async {
                      _searchWord = searchWordController.text;
                      if (_searchWord != '') {}
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyDrawer.myBottomNavigationBar(context, 2),
      ),
    );
  }
}
