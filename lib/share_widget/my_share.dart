import 'package:flutter/material.dart';
//共有(share)のメソッド
import 'package:share/share.dart';

class MyShare {
  static void _share() => Share.share('みんなも共同保有の森で本を読もう!');

  static Widget myShare(){
    return IconButton(
      icon: const Icon(Icons.share),
      onPressed: () => _share(),
    );
  }
}