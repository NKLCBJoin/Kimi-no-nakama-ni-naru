import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:you_my_colleague/View/board_new.dart';

class board1 extends StatefulWidget {
  const board1({Key? key}) : super(key: key);

  @override
  State<board1> createState() => _board1State();
}

class _board1State extends State<board1> {
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
                            child: Text('통합 게시판', style: TextStyle(fontSize: 25, color: Colors.black),)
                        ),
                        Flexible(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => const boardNew())
                                );
                              },
                              child: Icon(
                                Icons.new_label,

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
          .collection('/post/ZQGCDA86AjRHWF7dvJAO/게시판')
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
              String title = docs[index]['title'];
              String date = docs[index]['date'];
              String description = docs[index]['description'];
              String board = docs[index]['board'];

              return GestureDetector(
                  onTap: () {

                  },

                  child:
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.end,children: [Text(date, style: TextStyle(fontSize:  15, color: Colors.grey,),)]),
                          Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text(title, style: TextStyle(fontSize:  23, fontWeight: FontWeight.bold, color: Colors.black,),)]),
                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text(description, style: TextStyle(fontSize:  15, fontWeight: FontWeight.bold, color: Colors.grey,),)]),
                          SizedBox(height: 15,),
                          Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text(board, style: TextStyle(fontSize:  15, fontWeight: FontWeight.bold, color: Colors.grey,),)]),
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
      ),
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
