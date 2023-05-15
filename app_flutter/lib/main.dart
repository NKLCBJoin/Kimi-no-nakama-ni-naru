import 'package:flutter/material.dart';
import 'package:you_my_colleague/View/StartPage.dart';
import 'package:you_my_colleague/View/homepage.dart';
import 'View/board_main.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '37ebe54921c4c2981a2398e39c0cef16', javaScriptAppKey: '08e9877e4fbca0291d56d655e4cdcd88');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluter_Comu',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: const StartPage(),
    );
  }
}
