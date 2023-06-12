import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:you_my_colleague/View/common_UI/bottomNav.dart';
import '../Kakao/kakao.dart';
import '../Kakao/main_model.dart';



class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인페이지'),
      ),
      body:
          StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if(!snapshot.hasData) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        KakaoLogin(),
                        SizedBox(width: 200, height: 20,),
                        InkWell(
                            child: Image.asset(
                              'images/naver_login.png', width: 200,
                              height: 50,
                              fit: BoxFit.cover,),
                            onTap: () {

                            }
                        ),
                        SizedBox(width: 200, height: 20,),
                        InkWell(
                            child: Image.asset(
                              'images/google_login.png', width: 200,
                              height: 50,
                              fit: BoxFit.cover,),
                            onTap: () {

                            }
                        ),
                      ],
                    )
                  ],
                );
              }
              return Container(

              );
            },
          ),
    );
  }
}
