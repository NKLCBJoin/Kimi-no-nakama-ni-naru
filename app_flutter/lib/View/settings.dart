import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.all(5.0),
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 45,),

                Row(
                  children: [
                    Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Image.asset(
                            'images/icons8-less-than-30.png',
                            width: 35,
                            height: 35,
                          ),
                        )
                    ),

                    Flexible(flex: 1,fit: FlexFit.tight,child: SizedBox(width: 100,)),

                    Flexible(
                        flex: 1,
                        child: Text('내 설정', style: TextStyle(fontSize: 20, color: Colors.black),)
                    ),
                  ],
                ),

                SizedBox(height: 20,),
                Container(width: 2000, height: 2, decoration: BoxDecoration(color: Colors.black54),),
                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'images/icons8-edit-48.png',
                            width: 45,
                            height: 45,
                          ),
                          SizedBox(width:30),
                          Text('내 닉네임 변경', style: TextStyle(fontSize: 20, color: Colors.black),)
                        ],
                      ),
                      SizedBox(height: 20,),

                      Row(
                        children: [
                          Image.asset(
                            'images/icons8-edit-image-48.png',
                            width: 45,
                            height: 45,
                          ),
                          SizedBox(width:30),
                          Text('프로필 이미지 변경', style: TextStyle(fontSize: 20, color: Colors.black),)
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Image.asset(
                            'images/icons8-notification-48.png',
                            width: 45,
                            height: 45,
                          ),
                          SizedBox(width:30),
                          Text('알림 설정', style: TextStyle(fontSize: 20, color: Colors.black),)
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Image.asset(
                            'images/icons8-cancel-48.png',
                            width: 45,
                            height: 45,
                          ),
                          SizedBox(width:30),
                          Text('로그아웃', style: TextStyle(fontSize: 20, color: Colors.black),)
                        ],
                      ),
                    ],
                  )
                ),
              ],
            ),
          )
      );
  }
}