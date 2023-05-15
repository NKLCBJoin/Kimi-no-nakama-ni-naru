import 'package:flutter/material.dart';

class board_hot_board extends StatefulWidget {
  const board_hot_board({Key? key}) : super(key: key);

  @override
  State<board_hot_board> createState() => _board_hot_boardState();
}

class _board_hot_boardState extends State<board_hot_board> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: EmptyAppBar(),
          body: Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 15,),

                    Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: Image.asset('images/icons8-less-than-30.png', width: 35, height: 35,)
                        ),

                        Flexible(flex: 1, child: SizedBox(width: 100,)),

                        Flexible(
                            flex: 1,
                            child: Text('이 주의 게시글', style: TextStyle(fontSize: 20, color: Colors.black),)
                        ),
                      ],
                    ),

                    SizedBox(height: 20,),
                    Container(width: 1000, height: 2, decoration: BoxDecoration(color: Colors.black54),),

                    Container(
                        child: Flexible(
                          child: ListViewPage(),
                        )
                    )
                  ],
                ),
              )
          ),
        )
    );
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  //서버에서 가져올 분야 리스트
  var board_info = [
    ['AI개발자 팀원 구해요', '22년 3월 14일', '함께 공모전 나갈 팀원을 구합니다', 'AI개발자 게시판'],
    ['프론트엔드 개발자 찾습니다', '22년 3월 15일', '함께 프로젝트를 할 개발자를 구합니다', '프론트엔드 게시판'],
    ['iOS 앱 개발자 구합니다', '22년 3월 16일', '함께 앱을 개발할 개발자를 구합니다', 'iOS 개발자 게시판'],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: board_info.length,
      itemBuilder: (context, index) {
        String title = board_info[index][0];
        String date = board_info[index][1];
        String description = board_info[index][2];
        String board = board_info[index][3];

        return GestureDetector(
            onTap: () {

            },

            child:
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.end,children: [Text(date, style: TextStyle(fontSize:  13, color: Colors.grey,),)]),

                    Row(children: [
                      Image.asset('images/icons8-customer-48.png', width: 36, height: 36,),
                      Text('개발하는 멍멍이', style: TextStyle(fontSize:  25, color: Colors.black, fontWeight: FontWeight.bold,),)
                    ]),
                    SizedBox(height: 10,),
                    Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text(title, style: TextStyle(fontSize:  23, color: Colors.black,),)]),
                    SizedBox(height: 10,),
                    Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text(description, style: TextStyle(fontSize:  15, fontWeight: FontWeight.bold, color: Colors.grey,),)]),
                    SizedBox(height: 15,),
                    Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text(board, style: TextStyle(fontSize:  15, fontWeight: FontWeight.bold, color: Colors.grey,),)]),
                    Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                      Image.asset('images/icons8-good-quality-48.png', width: 16, height: 16,),
                      Text('222')
                    ]),
                    SizedBox(height: 15,),
                    Container(width: 1000, height: 2, decoration: BoxDecoration(color: Colors.black54),),
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}