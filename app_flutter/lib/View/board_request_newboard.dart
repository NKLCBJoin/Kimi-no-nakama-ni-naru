import 'package:flutter/material.dart';
import 'board_main.dart';

class board_request_newboard extends StatefulWidget {
  const board_request_newboard({Key? key}) : super(key: key);

  @override
  State<board_request_newboard> createState() => _board_request_newboardState();
}

class _board_request_newboardState extends State<board_request_newboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 4,
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Board_main())
                            );
                          }, child: Container(child: Text('게시판',style: TextStyle(fontSize: 22, color: const Color(0xffB5B5B5)),)),
                        ),
                      ),

                      SizedBox(width: 2,),

                      Flexible(
                        flex: 5,
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const board_request_newboard())
                            );
                          }, child: Container(child: Text('개설요청',style: TextStyle(fontSize: 25, color: Colors.black))),
                        ),
                      ),
                      Flexible(flex: 1, child: Container()),

                      Flexible(flex: 5,
                          child: Row(
                            children: [
                              Image.asset('images/icons8-task-completed-48.png',width: 36,height: 36,),
                              SizedBox(width: 3,),
                              Text('작성완료', style: TextStyle(fontSize: 20, color: Colors.black87))
                            ],
                          )
                      ),
                    ],
                  ),
                ),

                //제목부분 보여주기
                Flexible(
                    flex: 1,
                    child : Row(
                      children: [
                        Text('분야  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: const Color(0xffB5B5B5))),
                      ],
                    )
                ),
                SizedBox(height: 20,),
                Container(
                  height:1.0,
                  width:500.0,
                  color:Colors.black26,),
                SizedBox(height: 20,),
                Flexible(
                    flex: 5,
                    child : Row(
                      children: [
                        Text('개설에 대한 어필을 입력해주세요.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: const Color(0xffB5B5B5))),
                      ],
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
    );
  }
}