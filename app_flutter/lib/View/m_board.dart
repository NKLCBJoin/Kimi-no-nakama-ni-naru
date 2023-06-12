import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:you_my_colleague/View/board_new.dart';



class MessageBoard extends StatefulWidget {
  const MessageBoard({Key? key}) : super(key: key);

  @override
  State<MessageBoard> createState() => _MessageBoard();
}

class _MessageBoard extends State<MessageBoard> {
  late TextEditingController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
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
                            child: Text('쪽지보내기', style: TextStyle(fontSize: 25, color: Colors.black),)
                        ),
                        InkWell(
                          onTap: () {

                          },
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                            onPressed: () {  },
                            child: Text("전송", style: TextStyle(fontSize: 15, color: Colors.white),),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20,),
                    Container(width: 1000, height: 2, decoration: BoxDecoration(color: Colors.black54),),

                    SingleChildScrollView(
                      child: Flexible(
                        child: Column(
                          children: [
                            TextField(
                              onChanged: (text){
                                setState(() {

                                });
                              },
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              controller: _controller,
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