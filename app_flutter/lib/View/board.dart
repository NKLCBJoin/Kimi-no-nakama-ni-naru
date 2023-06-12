import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Kakao/kakao_login.dart';
import '../Kakao/main_model.dart';
import 'board_1.dart';
import 'm_board.dart';

enum MENU {_new,sendMessage,call,shareUrl,delete }
class Board extends StatefulWidget {
  Board({this.parseTitle, this.parseDate,this.parseBoard,this.parseDescription, this.parseId});//재민 날짜별 날씨데이터 가져오기
  final dynamic parseTitle;
  final dynamic parseBoard;
  final dynamic parseDate;
  final dynamic parseDescription;
  final dynamic parseId;

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {

  final viewModel = MainModel(KakaoLogin());
  String title ='';
  String board ='';
  String date ='';
  String description ='';
  String id ='';


  void UpdateData (dynamic parseTitle, dynamic parseBoard, dynamic parseDate, dynamic parseDescription, dynamic parseId) async{
      title = parseTitle;
      board = parseBoard;
      date = parseDate;
      description = parseDescription;
      id = parseId;

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UpdateData(widget.parseTitle,widget.parseBoard,widget.parseDate,widget.parseDescription,widget.parseId);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: EmptyAppBar(),
          resizeToAvoidBottomInset:false,
          body: Container(
            child: Column(
              children: [
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Flexible(
                        flex: 1,
                        child: Text(board, style: TextStyle(
                            fontSize: 20, color: Colors.black),)
                    ),
                    Container(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: Icon(
                              Icons.light_outlined,
                              color: Colors.black87,
                              size: 40,
                            ),
                          ),
                          SizedBox(width: 10,),
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('/post/ZQGCDA86AjRHWF7dvJAO/게시판')
                                .snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final docs = snapshot.data!.docs;
                                return PopupMenuButton<MENU>(
                                  onSelected: (MENU result) {
                                    setState(() {
                                      if (result == MENU._new) {

                                      }
                                      else if (result == MENU.sendMessage) {
                                        Navigator.push(
                                            context, MaterialPageRoute(
                                            builder: (
                                                context) => const MessageBoard())
                                        );
                                      }
                                      else if (result == MENU.delete) {
                                        FirebaseFirestore.instance.collection("/post/ZQGCDA86AjRHWF7dvJAO/게시판").doc(id).delete();
                                        setState(() {
                                          Navigator.of(context).pop();
                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => const board1())
                                          );
                                        });
                                      }
                                    });
                                  },
                                  itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry <MENU>>[
                                    const PopupMenuItem<MENU>(
                                      value: MENU._new,
                                      child: Text
                                        ('새로고침'),
                                    ),
                                    const PopupMenuItem<MENU>(
                                      value: MENU.sendMessage,
                                      child: Text
                                        ('쪽지 보내기'),
                                    ),
                                    const PopupMenuItem<MENU>(
                                      value: MENU.call,
                                      child: Text
                                        ('신고'),
                                    ),
                                    const PopupMenuItem<MENU>(
                                      value: MENU.shareUrl,
                                      child: Text
                                        ('URL 공유'),
                                    ),
                                    const PopupMenuItem<MENU>(
                                      value: MENU.delete,
                                      child: Text
                                        ('게시글 삭제'),
                                    ),
                                  ],
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(width: 1000, height: 2, decoration: BoxDecoration(color: Colors.black54),),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 5,),
                        // Image.network(viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
                        Image.asset('images/익명.jpg',width: 50,height: 50, ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("익명", style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                            Text(date),
                          ]
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 5,),
                        Text(title, style: GoogleFonts.kanit(
                          fontSize: 25.0,
                          color:Colors.black87,
                          textStyle: TextStyle(fontWeight: FontWeight.bold,)
                        )),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 5,),
                        Expanded(
                          child: Text(description, style: TextStyle(
                              fontSize: 25, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(width: 1000, height: 2, decoration: BoxDecoration(color: Colors.black54),),
                  ]
                ),
                Flexible(child: Comment(parseId : id)),
              ],
            ),
          ),
          bottomSheet: SafeArea(
            child: CommentView(parseId : id),
         ),
        )
    );
  }
}

class CommentView extends StatefulWidget {
  CommentView({this.parseId});
  final dynamic parseId;

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  int num =1;
  String inputName = '익명';
  String inputContent = '';
  String inputTime = '';
  late TextEditingController _CommentController;
  DateTime now = new DateTime.now();
  late String inputDate = '${now.year.toString().split('-')[0]}년${now.month}월${now.day}일';
  String id ='';

  void UpdateData (dynamic parseId) async{
    id = parseId;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UpdateData(widget.parseId);
    _CommentController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Row(
            children: [
              Icon(
                Icons.check_box_outlined,
              ),
              Text('익명', style: TextStyle(color: Colors.red),),
            ],
          ),
          SizedBox(width: 10,),
          Container(
            color: Colors.white,
            width: 280,
            child: SingleChildScrollView(
              child: Flexible(
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                        inputContent = text;
                    });
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: _CommentController,
                  decoration: InputDecoration(
                      labelText: '댓글을 입력하세요',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(3)
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: () {
              FirebaseFirestore.instance.collection('/post/ZQGCDA86AjRHWF7dvJAO/게시판/$id/댓글')
                  .add({'c_name': '${'익명' + num.toString()}', 'c_date': '${inputDate}',
                'c_content': '${inputContent}',  'timestamp': FieldValue.serverTimestamp()});
              num++;
              setState(() {
                CommentView();
              });
            },
            child: Text('확인'),
          ),
        ],
      ),
    );
  }
}

class Comment extends StatefulWidget {
  Comment({this.parseId});
  final dynamic parseId;

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  String id ='';

  void UpdateData (dynamic parseId) async{
    id = parseId;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UpdateData(widget.parseId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('/post/ZQGCDA86AjRHWF7dvJAO/게시판/$id/댓글').orderBy('timestamp',descending: false)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting)
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final docs= snapshot.data!.docs;
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                String name = docs[index]['c_name'];
                String date = docs[index]['c_date'];
                String content = docs[index]['c_content'];
                return Container(
                  child: Flexible(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 5,),
                            Image.asset('images/익명.jpg',width: 30,height: 30, ),
                            SizedBox(width: 5,),
                            Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 5,),
                            Text(content,style: TextStyle(fontSize: 15),),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 5,),
                            Text(date,style: TextStyle(fontSize: 15),),
                          ],
                        ),
                        Container(width: 1000, height: 2, decoration: BoxDecoration(color: Colors.black54),),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                );
              },
            );
          }
      ),
    );
  }
}
