//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
// import 'package:you_my_colleague/Kakao/social_login.dart';
// import '../Firebase/firebase_auth_remote_data_source.dart';
//
// class MainModel {
//   late final SocialLogin _socialLogin;
//   late final _firebaseAuthDataSource = FirebaseAuthRemoteDataSource();
//   bool isLogined = false;
//   kakao.User? user;
//
//   MainModel(this._socialLogin);
//
//   Future login() async{
//     isLogined = await _socialLogin.login();
//     if(isLogined) {
//       user = await kakao.UserApi.instance.me();
//
//       // final customToken = await _firebaseAuthDataSource.createCustomToken({
//       //   'uid': user!.id.toString(),
//       //   'displayName': user!.kakaoAccount!.profile!.nickname,
//       //   'email': user!.kakaoAccount!.email!,
//       //   'photoURL': user!.kakaoAccount!.profile!.profileImageUrl!,
//       // });
//       // await FirebaseAuth.instance.signInWithCustomToken(customToken);
//     }
//   }
//   Future logout() async{
//     await _socialLogin.logout();
//     isLogined = false;
//     user = null;
//   }
// }