import 'package:flutter/material.dart';

import 'package:share_book_platform/complete_first_register.dart';
import 'package:share_book_platform/share_widget/drawer.dart';
import 'package:share_book_platform/share_widget/my_share.dart';

class NewMember extends StatefulWidget {
  @override
  _NewMemberState createState() => _NewMemberState();
}

class _NewMemberState extends State<NewMember> {
  final nitIdController = TextEditingController();
  String _nitId = '';
  final nitPasswordController = TextEditingController();
  String _nitPassword = '';
  final idController = TextEditingController();
  String _id = '';
  final passwordController = TextEditingController();
  String _password = '';
  final rePasswordController = TextEditingController();
  String _rePassword = '';
  final emailController = TextEditingController();
  String _email = '';

  bool _isCheck = false;

  @override
  void dispose() {
    nitIdController.dispose();
    nitPasswordController.dispose();
    idController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
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
          //共有(share)のボタン
          actions: [
            MyShare.myShare(),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  '現時点では、このサービスを利用できるのは名工大生のみです。',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      activeColor: Colors.blueAccent,
                      value: _isCheck,
                      onChanged: (bool? value) {
                        setState(() {
                          _isCheck = value!;
                        });
                      },
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'あなたは名工大の学生ですか。',
                    ),
                  ],
                ),
                TextFormField(
                  controller: nitIdController,
                  maxLength: 8,
                  decoration: const InputDecoration(
                    hintText: 'please your university number',
                    labelText: '名工大ID(基盤ID)',
                  ),
                ),
                TextFormField(
                  controller: nitPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'please your university password',
                    labelText: '名工大のログインパスワード',
                  ),
                ),
                TextFormField(
                  controller: idController,
                  maxLength: 8,
                  //入力可能キーボード
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'please your student number',
                    labelText: '会員番号(学籍番号)',
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'please make password',
                    labelText: 'パスワードの作成',
                  ),
                ),
                TextFormField(
                  controller: rePasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'please enter your password again',
                    labelText: 'パスワードの確認',
                  ),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'please enter your e-mail',
                    labelText: 'メールアドレス',
                  ),
                ),
                RaisedButton(
                  child: const Text('送信'),
                  onPressed: () async {
                    _nitId = nitIdController.text;
                    _nitPassword = nitPasswordController.text;
                    _id = idController.text;
                    _password = passwordController.text;
                    _rePassword = rePasswordController.text;
                    _email = emailController.text;
                    if (_nitId != '' && _nitPassword  != '' &&_id != '' && _password != '' && _rePassword != ''&& _email != '' && _password == _rePassword) {
                      await MyDrawer.movePage(context, CompleteFirstRegister());
                    }
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
