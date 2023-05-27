import 'package:flutter/material.dart';
import 'package:you_my_colleague/View/common_UI/bottomNav.dart';
import '../Kakao/kakao_login.dart';
import '../Kakao/main_model.dart';



class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final viewModel = MainModel(KakaoLogin());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인페이지'),
      ),
      body:
          Container(
            //margin: EdgeInsets.fromLTRB(700, 300, 700, 300),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
                width: 10
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(30)
              )
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${viewModel.isLogined}'),
                        InkWell(
                            child: Image.asset('images/kakao_login_medium_narrow.png',width: 200,height: 50, fit: BoxFit.cover,),
                            onTap: () async{
                              await viewModel.login();
                              setState(() async{
                                     await Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return bottomNav();
                                    }));
                              });
                            }
                        ),
                        SizedBox(width: 200,height: 20,),
                        InkWell(
                            child: Image.asset('images/naver_login.png',width: 200,height: 50,fit: BoxFit.cover,),
                            onTap: (){

                            }
                        ),
                        SizedBox(width: 200,height: 20,),
                        InkWell(
                            child: Image.asset('images/google_login.png',width: 200,height: 50,fit: BoxFit.cover,),
                            onTap: (){

                            }
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
            ),
    );
  }
}
