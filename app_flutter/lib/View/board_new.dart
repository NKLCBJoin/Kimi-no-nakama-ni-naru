import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:you_my_colleague/Kakao/kakao_model.dart';

class boardNew extends StatefulWidget {
  const boardNew({Key? key}) : super(key: key);

  @override
  State<boardNew> createState() => _boardNewState();
}
class _boardNewState extends State<boardNew> {
  final _valueList = ['자유 게시판','인공지능 게시판', '백엔드 게시판', '프론트엔드 게시판'];
  var _selectValue = '인공지능 게시판';
  late TextEditingController _controller;
  late TextEditingController _controller2;
  String inputTitle = '';
  String inputContent = '';
  String inputBoard = '';
  String inputTime = '';
  DateTime now = new DateTime.now();

  late String inputDate = now.year.toString().split('-')[0] +'년'+ now.month.toString()+'월'+ now.day.toString()+'일';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
    _controller2 = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset:false,
          appBar: EmptyAppBar(),
          body: Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
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
                            child: Text('게시글 생성', style: TextStyle(fontSize: 25, color: Colors.black),)
                        ),
                        Flexible(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true, //바깥 영역 터치시 닫을지 여부 결정
                                  builder: ((context) {
                                    return AlertDialog(
                                      title: Text("게시판을 등록 하시겠습니까?"),
                                      actions: <Widget>[
                                        Container(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              FirebaseFirestore.instance.collection('/post/ZQGCDA86AjRHWF7dvJAO/게시판')
                                                  .add({'title': '${inputTitle}', 'date': '${inputDate}',
                                                'userName' : '${KakaoData.user_name}', 'userData': '${KakaoData.user_id}', 'boardId': UserData.u_index,
                                                'description': '${inputContent}', 'board':'${inputBoard}', 'timestamp': FieldValue.serverTimestamp()});
                                              String id = FirebaseFirestore.instance.collection('/post/ZQGCDA86AjRHWF7dvJAO/게시판').id;
                                              setState(() {
                                                FirebaseFirestore.instance.collection('/post/ZQGCDA86AjRHWF7dvJAO/게시판/$id/댓글')
                                                    .add({'c_name': '','c_userData':'', 'c_date': '',
                                                  'c_content': '','c_image':'',  'timestamp':''});
                                                UserData.user_num.add(0);
                                                UserData.u_index++;
                                                print(UserData.u_index);
                                                Navigator.of(context).pop(); //창 닫기
                                                Navigator.pop(context);

                                              });
                                            },
                                            child: Text("네"),
                                          ),
                                        ),
                                        Container(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(); //창 닫기
                                            },
                                            child: Text("아니요"),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                );

                              },

                              child: Icon(
                                Icons.check,
                                color: Colors.black87,
                                size: 40,
                              ),
                            )
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(width: 1000, height: 2, decoration: BoxDecoration(color: Colors.black54),),

                    Row(
                      children: [
                        InkWell(
                          onTap: ()
                          {
                            setState(() {
                              if(KakaoData.showName == false)
                                KakaoData.showName = true;
                              else
                                KakaoData.showName = false;
                            });
                          },
                          child: Icon(
                            KakaoData.showName? Icons.check_box_outlined : Icons.check_box,color: Colors.red,
                          ),
                        ),
                        Text('익명', style: TextStyle(color: Colors.red),),
                        SizedBox(width: 70,),
                        Container(
                          child: Center(
                            child: DropdownButton(
                              value: _selectValue,
                              items: _valueList.map(
                                    (value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),

                                  );
                                },
                              ).toList(),
                              onChanged: (value){
                                setState(() {
                                  _selectValue = value!;
                                  inputBoard = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    SingleChildScrollView(
                      child: Flexible(
                        child: Column(
                          children: [
                            TextField(
                              onChanged: (text){
                                setState(() {
                                    inputTitle = text;
                                });
                              },
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              controller: _controller,
                              decoration: InputDecoration(
                                  labelText: '제목 입력하세요',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(3)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(width: 1000, height: 2, decoration: BoxDecoration(color: Colors.black54),),
                    SingleChildScrollView(
                        child: Flexible(
                          child: Column(
                            children: [
                              TextField(
                                onChanged: (text){
                                  setState(() {
                                    inputContent = text;
                                  });
                                },
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                controller: _controller2,
                                decoration: InputDecoration(
                                    labelText: '내용 입력하세요',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(3)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              )
          ),
        )
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

