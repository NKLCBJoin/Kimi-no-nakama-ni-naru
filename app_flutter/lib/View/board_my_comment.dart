import 'package:flutter/material.dart';

class board_my_comment extends StatefulWidget {
  const board_my_comment({Key? key}) : super(key: key);

  @override
  State<board_my_comment> createState() => _board_my_commentState();
}

class _board_my_commentState extends State<board_my_comment> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: EmptyAppBar(),
          body: Padding(
              padding: EdgeInsets.all(0.0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 15,),

                    Row(
                      children: [
                        SizedBox(height: 20,),
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


                        Flexible(flex: 1, child: SizedBox(width: 100,)),

                        Flexible(
                            flex: 2,
                            child: Text('내가 작성한 댓글', style: TextStyle(fontSize: 20, color: Colors.black),)
                        ),
                      ],
                    ),

                    SizedBox(height: 20,),
                    Container(width: 1000, height: 2, decoration: BoxDecoration(color: Colors.black54),),

                    Expanded(child: ListViewPage())
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

  //아마 sql문으로 해당 게시글에 대한 내가 쓴 댓글을 쿼리처리해서 댓글만 뽑아올 수 있을 것 같다.
  var board_comment = [
    ['22년 3월 15일', '사이트 주소 좀 올려주실래요?'],
    ['22년 3월 16일', '프론트 경력 15년입니다 같이 하시죠'],
    ['22년 3월 17일', '아이폰 없어도 되나영?']
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

            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.end,children: [Text(date, style: TextStyle(fontSize:  15, color: Colors.grey,),)]),
                          Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text(title, style: TextStyle(fontSize:  23, fontWeight: FontWeight.bold, color: Colors.black,),)]),
                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text(description, style: TextStyle(fontSize:  15, fontWeight: FontWeight.bold, color: Colors.grey,),)]),
                          SizedBox(height: 20,),
                          Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text(board, style: TextStyle(fontSize:  15, fontWeight: FontWeight.bold, color: Colors.grey,),)]),
                          SizedBox(height: 15,),
                        ],
                      )
                    ),

                    Container(width: 1000, height: 2, decoration: BoxDecoration(color: Colors.black54),),

                    Row(mainAxisAlignment: MainAxisAlignment.end,children: [Text(date, style: TextStyle(fontSize:  15, color: Colors.grey,),)]),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset('images/icons8-comments-48.png',width: 35, height: 35,),
                          SizedBox(width: 10,),
                          Text('${board_comment[index]}')
                        ]
                      )
                    ),
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