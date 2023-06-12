import 'package:flutter/material.dart';
import 'package:you_my_colleague/View/StartPage.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:you_my_colleague/View/common_UI/bottomNav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  KakaoSdk.init(nativeAppKey: '37ebe54921c4c2981a2398e39c0cef16', javaScriptAppKey: '08e9877e4fbca0291d56d655e4cdcd88');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fluter_Comu',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: const StartPage(),
    );
  }
}
class Yamc extends StatefulWidget {
  const Yamc({Key? key}) : super(key: key);

  @override
  State<Yamc> createState() => _YamcState();
}

class _YamcState extends State<Yamc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //bottomNav에서 페이지 선택함
        home: bottomNav()
    );
  }
}