import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:you_my_colleague/Kakao/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:you_my_colleague/View/common_UI/bottomNav.dart';
import 'kakao_model.dart';

void KakaoToken(){
  Future<bool?> getT() async {
    if (await AuthApi.instance.hasToken()) {
      AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
      KakaoData.Token = true;
      print('----------------------------------');
      print('토큰이 이미 존재합니다'
          '\n회원정보: ${tokenInfo.id}'
          '\n만료시간: ${tokenInfo.expiresIn} 초');
      print('----------------------------------');

      var user = await UserApi.instance.me();//유저 정보 user에 담는다.
      KakaoData.userImage_URL = (user.kakaoAccount?.profile?.profileImageUrl).toString();
      KakaoData.user_gen = (user.kakaoAccount?.gender).toString();
      KakaoData.user_name = (user.kakaoAccount?.profile?.nickname).toString();
      KakaoData.user_email = (user.kakaoAccount?.email).toString();
      KakaoData.user_id = Random().nextInt(1000);

      await Future.delayed(Duration(seconds: 1));//땡겨오는 시간 딜레이 대기
      return true;
    }
    else {
      KakaoData.Token = false;
      print('----------------------------------');
      print('토큰이 없어요. . .');
      print('----------------------------------');
      return false;
    }
  }

  Future<bool?> future = getT();
}

//<-------------------로그인 클래스 정의----------------------->
class KakaoLogin extends StatelessWidget {
  const KakaoLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(

        child: Image.asset('images/kakao_login_medium_narrow.png',width: 200,height: 50, fit: BoxFit.cover,),
        onTap: () async {
          //[1] 카카오톡 설치 여부
          if(await isKakaoTalkInstalled()){
            try {
              //[2] 이미 로그인 했나 토큰 유효성 확인 후 로그인 시도
              AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
              User user = await UserApi.instance.me();//유저 정보 user에 담는다.
              KakaoToken();
              print('토큰 정보 보기 성공'
                  '\n회원정보: ${tokenInfo.id}'
                  '\n토큰 만료시간: ${tokenInfo.expiresIn} 초');
              //[3]정상적으로 토큰 성공을 한 경우 메인 페이지로 다시 돌아갑니다.
              KakaoData.Token = true;
              Navigator.push
                (context,
                  MaterialPageRoute(builder: (context) => bottomNav()));
            } catch (error) {
              print('토큰 정보 보기 실패 $error');
              try {
                //[2-1] 카카오톡 로그인 접속 시도
                await UserApi.instance.loginWithKakaoTalk();
                User user = await UserApi.instance.me();
                print('카카오톡으로 로그인 성공');
                //★★★★★★★★★다음 페이지 넘어가면서 user넘겨줌★★★★★★★★★
                //model폴더의 temp.dart를 보면 user 사용 예시 찾기 가능
                KakaoData.Token = true;
                Navigator.push
                  (context,
                  MaterialPageRoute(builder: (context) => bottomNav()),);
              } catch (error) {
                print('카카오톡으로 로그인 실패 $error');
              }
            }
          }
          //[1-1 카카오톡 미설치
          else{
            showDialog(
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),

                    title: new Text("카카오톡 설치 후 실행해주세요!"),

                    actions: <Widget>[
                      new ElevatedButton(
                        child: new Text("Close"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                }
            );
          }
        }
    );
  }
}

//<-------------------로그아웃 클래스 정의----------------------->
class KakaoLogout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(Icons.autorenew_outlined),
      label: Text("로그아웃",style: TextStyle(fontSize: 17, color: Colors.black87),),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.yellow),
          foregroundColor: MaterialStateProperty.all(Colors.black54),
          minimumSize: MaterialStateProperty.all(Size(250, 50))
      ),
      onPressed: () async {
        try {
          await UserApi.instance.unlink();
          print('연결 끊기 성공, SDK에서 토큰 삭제');
        } catch (error) {
          print('연결 끊기 실패 $error');
        }
      },
    );
  }
}

//<--------------------공유 함수 정의----------------------->
// void KakaoShare() async {
//   if(await ShareClient.instance.isKakaoTalkSharingAvailable()) {
//     try {
//       Uri uri = await ShareClient.instance.shareDefault(template: defaultFeed);
//       await ShareClient.instance.launchKakaoTalk(uri);
//       print('카카오톡 공유 완료');
//     } catch (error) {
//       print('카카오톡 공유 실패 $error');
//     }
//   }
// }