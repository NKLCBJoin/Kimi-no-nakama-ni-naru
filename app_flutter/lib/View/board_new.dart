import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class boardNew extends StatefulWidget {
  const boardNew({Key? key}) : super(key: key);

  @override
  State<boardNew> createState() => _boardNewState();
}



class _boardNewState extends State<boardNew> {
  final _valueList = ['인공지능 게시판', '백엔드 게시판', '프론트엔드 게시판'];
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
        home: Scaffold(
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
                                FirebaseFirestore.instance.collection('/post/ZQGCDA86AjRHWF7dvJAO/게시판')
                                    .add({'title': '${inputTitle}', 'date': '${inputDate}',
                                  'description': '${inputContent}', 'board':'${inputBoard}'});
                                setState(() {
                                  Navigator.pop(context);
                                });
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
                    SizedBox(height: 20,),
                    SizedBox(
                      height: 50,
                      child: Flexible(
                        child: Column(
                          children: [
                            TextField(
                              onChanged: (text){
                                setState(() {
                                    inputTitle = text;
                                });
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[a-z|A-Z|0-9|ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ|ᄀᆞ|ᄂᆞ|ᄃᆞ|ᄅᆞ|ᄆᆞ|ᄇᆞ|ᄉᆞ|ᄋᆞ|ᄌᆞ|ᄎᆞ|ᄏᆞ|ᄐᆞ|ᄑᆞ|ᄒᆞ]')),
                              ],
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              controller: _controller,
                              decoration: InputDecoration(
                                  labelText: '제목 입력하세요',
                                  hintText: '???',  //글자를 입력하면 사라진다.
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
                                    hintText: '???',  //글자를 입력하면 사라진다.
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
