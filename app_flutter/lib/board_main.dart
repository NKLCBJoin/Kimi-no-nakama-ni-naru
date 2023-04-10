import 'package:flutter/material.dart';

class Board_main extends StatelessWidget {
  const Board_main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'community',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Flexible(
                  child: Row(
                    children: [
                      Flexible(
                        flex: 5,
                        child: Container(child: Text('게시판',style: TextStyle(fontSize: 25),)),
                      ),
                      Flexible(flex: 1, child: Container()),
                      Flexible(
                        flex: 5,
                        child: Container(child: Text('개설요청',style: TextStyle(fontSize: 25, color: const Color(0xffB5B5B5)),)),
                      ),
                      Flexible(flex: 3, child: Container()),
                    ],
                  ),flex: 1,
              ),

              //내가 작성한 글, 댓글 + 즐겨찾기 + 핫게
              Flexible(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.circular(15)),

                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),

                          Flexible(
                            flex: 3,
                            child: Row(
                              children: [
                                Image.asset('images/icons8-board-64.png', width: 50, height: 50,),
                                SizedBox(width: 10,),
                                Text('내가 작성한 글', style: TextStyle(fontSize: 25),)
                              ],
                            ),
                          ),

                          SizedBox(height: 15,),

                          Flexible(
                            flex: 3,
                            child: Row(
                              children: [
                                Image.asset('images/icons8-speech-bubble-30.png', width: 50, height: 50,),
                                SizedBox(width: 10,),
                                Text('내가 작성한 댓글', style: TextStyle(fontSize: 25),)
                              ],
                            ),
                          ),

                          SizedBox(height: 15,),

                          Flexible(
                            flex: 3,
                            child: Row(
                              children: [
                                Image.asset('images/icons8-add-to-favorites-100.png', width: 50, height: 50,),
                                SizedBox(width: 10,),
                                Text('즐겨찾기한 게시판', style: TextStyle(fontSize: 25),)
                              ],
                            ),
                          ),

                          SizedBox(height: 15,),
                          Flexible(
                            flex: 3,
                            child: Row(
                              children: [
                                Image.asset('images/icons8-fire-100.png', width: 50, height: 50,),
                                SizedBox(width: 10,),
                                Text('이 주의 게시판', style: TextStyle(fontSize: 25),)
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
                flex: 4,
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.circular(15)),

                    child: Container(
                        child: ListView(
                          children: [
                            ListTile(
                              leading: Image.asset('images/icons8-add-new-50.png', width: 50, height: 50,),
                              title: Text('FrontEnd'),
                            ),
                            ListTile(
                              leading: Image.asset('images/icons8-add-new-50.png', width: 50, height: 50,),
                              title: Text('BackEnd'),
                            ),
                            ListTile(
                              leading: Image.asset('images/icons8-add-new-50.png', width: 50, height: 50,),
                              title: Text('A.I'),
                            ),
                            ListTile(
                              leading: Image.asset('images/icons8-add-new-50.png', width: 50, height: 50,),
                              title: Text('Image Processing'),
                            ),

                          ],
                        )
                      ),
                    )
                ),
              //하단 네비게이션 바
              Flexible(
                  child: Row(),
                  flex: 1,
              )
            ],
          )
        )
      )
    );
  }
}