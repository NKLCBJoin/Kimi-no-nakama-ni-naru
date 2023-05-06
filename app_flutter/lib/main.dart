import 'package:flutter/material.dart';
import 'package:you_my_colleague/View/common_UI/bottomNav.dart';

void main() {
  runApp(Yamc());
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