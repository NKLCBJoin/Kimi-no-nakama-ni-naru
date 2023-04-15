import 'dart:math';

import 'package:flutter/material.dart';
import 'package:you_my_colleague/View/board_hot_board.dart';
import 'package:you_my_colleague/View/board_my_comment.dart';
import 'package:you_my_colleague/View/board_my_favorites.dart';
import 'package:you_my_colleague/View/board_my_write.dart';
import 'package:you_my_colleague/View/board_request_newboard.dart';
import 'package:you_my_colleague/View/settings.dart';

class Board_main extends StatefulWidget {
  const Board_main({Key? key}) : super(key: key);

  @override
  State<Board_main> createState() => _Board_mainState();
}

class _Board_mainState extends State<Board_main> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'd',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'd',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_active),
                  label: 'd',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'd',
                ),

              ],
            ),
            body: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    //SizedBox(height: 10,),
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 5,
                            child: Container(child: Text('게시판',style: TextStyle(fontSize: 25),)),
                          ),

                          SizedBox(width: 10,),

                          Flexible(
                            flex: 5,
                            child: TextButton(
                              onPressed: (){
                                log(1);
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => const board_request_newboard())
                                );
                              },
                              child: Container(child: Text('개설요청',style: TextStyle(fontSize: 25, color: const Color(0xffB5B5B5)),)),
                            ),
                          ),
                          Flexible(flex: 3, child: Container()),
                        ],
                      ),
                    ),

                    //내가 작성한 글, 댓글 + 즐겨찾기 + 핫게
                    Flexible(
                      flex: 5,
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                              borderRadius: BorderRadius.circular(15)),

                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),

                                  Flexible(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                            onPressed:() {
                                              log(2);
                                              Navigator.push(
                                                  context, MaterialPageRoute(builder: (context) => const board_my_write())
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              backgroundColor: Color(0xffFAFAFA),
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide.none,
                                                ),

                                            ),

                                            child: Row(
                                              children: [
                                                Image.asset('images/icons8-board-64.png', width: 50, height: 50,),
                                                SizedBox(width: 10,),
                                                Text('내가 작성한 글', style: TextStyle(fontSize: 25, color: Colors.black),)
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 15,),

                                  Flexible(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                            onPressed:() {
                                              log(2);
                                              Navigator.push(
                                                  context, MaterialPageRoute(builder: (context) => const board_my_comment())
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              backgroundColor: Color(0xffFAFAFA),
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide.none,
                                              ),

                                            ),

                                            child: Row(
                                              children: [
                                                Image.asset('images/icons8-speech-bubble-30.png', width: 50, height: 50,),
                                                SizedBox(width: 10,),
                                                Text('내가 작성한 댓글', style: TextStyle(fontSize: 25, color: Colors.black),)
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 15,),

                                  Flexible(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                            onPressed:() {
                                              log(2);
                                              Navigator.push(
                                                  context, MaterialPageRoute(builder: (context) => const board_my_favorites())
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              backgroundColor: Color(0xffFAFAFA),
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide.none,
                                              ),

                                            ),

                                            child: Row(
                                              children: [
                                                Image.asset('images/icons8-add-to-favorites-100.png', width: 50, height: 50,),
                                                SizedBox(width: 10,),
                                                Text('즐겨찾기한 게시글', style: TextStyle(fontSize: 25, color: Colors.black),)
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 15,),
                                  Flexible(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                            onPressed:() {
                                              log(2);
                                              Navigator.push(
                                                  context, MaterialPageRoute(builder: (context) => const board_hot_board())
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              backgroundColor: Color(0xffFAFAFA),
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide.none,
                                              ),

                                            ),

                                            child: Row(
                                              children: [
                                                Image.asset('images/icons8-fire-100.png', width: 50, height: 50,),
                                                SizedBox(width: 10,),
                                                Text('이 주의 게시글', style: TextStyle(fontSize: 25, color: Colors.black),)
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                      ),
                    ),

                    SizedBox(height: 30),

                    //Pick 부분 보여주기
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Text('Pick  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: const Color(0xffb74093))),
                          Text('관심있는 게시판을 추가하세요!', style: TextStyle(fontSize: 15, color: const Color(0xffA0A0A0))),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),

                    //픽 게시판 목록
                    //내가 작성한 글, 댓글 + 즐겨찾기 + 핫게
                    Flexible(
                        flex: 6,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                              borderRadius: BorderRadius.circular(15)),

                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                                child: ListViewPage()
                            ),
                          ),
                        )
                    ),
                  ],
                )
            )
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch(index) {
      case 0:
      // 홈 화면으로 이동
        break;
      case 1:
      // 대시보드 화면으로 이동
        break;
      case 2:
      // 알림 화면으로 이동
        break;
      case 3:
      // 설정 화면으로 이동
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingPage()),
        );
        break;
    }
  }
}


class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  //서버에서 가져올 분야 리스트
  var Field = [
    'FrontEnd',
    'BackEnd',
    'A.I',
    'IamgeProcessing',
    'UI/UX설계',
    'PM'
  ];

  var imageList = [
    'images/icons8-add-new-50.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: Field.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){

              },

              child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.asset(imageList[0]),
                      ),

                      SizedBox(width: 10,),

                      Text(Field[index], style: TextStyle(fontSize:  22, fontWeight: FontWeight.bold, color: Colors.black),)
                    ],
                ),
            );
          },
      ),
    );
  }
}


