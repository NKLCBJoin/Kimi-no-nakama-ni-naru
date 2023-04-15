import 'package:flutter/material.dart';

class board_my_favorites extends StatefulWidget {
  const board_my_favorites({Key? key}) : super(key: key);

  @override
  State<board_my_favorites> createState() => _board_my_favoritesState();
}

class _board_my_favoritesState extends State<board_my_favorites> {
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
                            child: Text('즐겨찾기한 게시글', style: TextStyle(fontSize: 20, color: Colors.black),)
                        ),
                      ],
                    ),

                    SizedBox(height: 20,),
                    Container(width: 1000, height: 2, decoration: BoxDecoration(color: Colors.black54),),

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