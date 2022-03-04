import 'package:flutter/material.dart';
import 'package:share_book_platform/all_items.dart';
import 'package:share_book_platform/inform_from_operation.dart';
import 'package:share_book_platform/introduce_new_books.dart';
import 'package:share_book_platform/main.dart';
import 'package:share_book_platform/search_book_collection.dart';
import 'package:share_book_platform/setting.dart';
import 'package:share_book_platform/using_record.dart';
import 'package:share_book_platform/using_register.dart';

class MyDrawer {
  static const String item0 = '利用登録';
  static const String item1 = '新刊紹介';
  static const String item2 = '利用記録';
  static const String item3 = 'お知らせ';
  static const String item4 = '詳細設定';
  static const String item5 = '蔵書検索';
  static const String itemLast = 'ログアウト';
  static const String item7 = 'ホーム';

  //要素を追加する時は後ろに
  static List<String> items() {
    return [item0, item1, item2, item3, item4, item5, itemLast, item7];
  }

  //ナビゲーションバー
  static Widget myDrawer(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: Text('サービス一覧'),
        ),
        ListTile(
          title: const Text(item0),
          onTap: () {
            movePage(context, UsingRegister());
          },
        ),
        ListTile(
          title: const Text(item2),
          onTap: () {
            movePage(context, UsingRecord());
          },
        ),
        ListTile(
          title: const Text(item1),
          onTap: () {
            movePage(context, IntroductNewBooks());
          },
        ),
        ListTile(
          title: const Text(item5),
          onTap: () {
            movePage(context, SearchBookCollection());
          },
        ),
        ListTile(
          title: const Text(item3),
          onTap: () {
            movePage(context, InformFromOperation());
          },
        ),
        ListTile(
          title: const Text(item4),
          onTap: () {
            movePage(context, Setting());
          },
        ),
        ListTile(
            title: const Text(itemLast),
            onTap: () {
              movePage(context, const MyHomePage(title: '共同保有の森ログインフォーム'));
            }),
      ],
    );
  }

  //ボトムバー
  static Widget myBottomNavigationBar(
      BuildContext context, int _selectedIndex) {
    int _initIndex = _selectedIndex;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: item7,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_active),
          label: item3,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: item5,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_sharp),
          label: item4,
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: (index) {
        _selectedIndex = index;
        if (_selectedIndex == 0 && _initIndex != 0) {
          movePage(context, AllItems());
        } else if (_selectedIndex == 1 && _initIndex != 1) {
          movePage(context, InformFromOperation());
        } else if (_selectedIndex == 2 && _initIndex != 2) {
          movePage(context, SearchBookCollection());
        } else if (_selectedIndex == 3 && _initIndex != 3) {
          movePage(context, Setting());
        }
      },
    );
  }

  //画面遷移するメソッド
  static Future movePage(BuildContext context, var pages) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pages,
      ),
    );
  }
}