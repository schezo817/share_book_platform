import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:share_book_platform/all_items.dart';
import 'package:share_book_platform/new_member.dart';
import 'package:share_book_platform/config/size_config.dart';
import 'package:share_book_platform/share_widget/drawer.dart';
import 'package:share_book_platform/share_widget/my_share.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '共同保有の森',
      theme: ThemeData(
        //appbarの色
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: '共同保有の森ログインフォーム'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final idController = TextEditingController();
  String _id = '';
  final passwordController = TextEditingController();
  String _password = '';

  //キーの保存用変数
  final _formKey = GlobalKey<FormState>();

  //チェックボックスの結果を覚える変数
  bool _isCheck = false;

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //画面サイズ管理
    SizeConfig().init(context);
    //web,Android上の戻るボタン無効化
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '共同保有の森',
            style: TextStyle(
              //色が黒
              color: Colors.black,
              //太め(boldがw700)
              fontWeight: FontWeight.w800,
            ),
          ),
          //appbar上の戻るボタン無効化
          automaticallyImplyLeading: false,
          actions:[
            MyShare.myShare(),
          ],
        ),
        body: Container(
          //画面を横一杯に使う
          width: double.infinity,
          //画面端の余白
          padding: const EdgeInsets.all(8),
          child: Column(
            //横方向で真ん中
            mainAxisAlignment: MainAxisAlignment.center,
            //縦方向で真ん中
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '共同保有の森',
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal! * 15,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3
                      ..color = Colors.green),
              ),
              //idの入力フォーマット
              TextFormField(
                //最大入力可能文字数
                maxLength: 8,
                controller: idController,
                //入力可能キーボード
                keyboardType: TextInputType.number,
                key: _formKey,
                decoration: const InputDecoration(
                  hintText: 'number',
                  labelText: '会員番号',
                ),
              ),
              //パスワードの入力フォーマット
              TextFormField(
                controller: passwordController,
                //伏字オン
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'please your password',
                  labelText: 'パスワード',
                ),
              ),
              Row(
                children: <Widget>[
                  //チェックボックスの表示
                  Checkbox(
                    //オンにしたときの色
                    activeColor: Colors.blueAccent,
                    value: _isCheck,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCheck = value!;
                      });
                    },
                  ),
                  const SizedBox(width: 5),
                  const Text('ログイン状態を維持する'),
                ],
              ),
              RaisedButton(
                child: const Text('ログイン'),
                onPressed: () async {
                  _id = idController.text;
                  _password = passwordController.text;
                  if (_id != '' && _password != '') {
                    await MyDrawer.movePage(context, AllItems());
                  }
                },
              ),
              TextButton(
                child: const Text(
                  '新規会員登録',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {
                  MyDrawer.movePage(context, NewMember());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
