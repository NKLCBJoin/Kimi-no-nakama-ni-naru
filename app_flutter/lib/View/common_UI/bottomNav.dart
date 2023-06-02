

import 'package:flutter/material.dart';
import 'package:you_my_colleague/View/alarm.dart';
import 'package:you_my_colleague/View/board_main.dart';
import 'package:you_my_colleague/View/homepage.dart';
import 'package:you_my_colleague/View/settings.dart';
import 'package:you_my_colleague/View/test.dart';

import '../board_1.dart';


//신근재
class bottomNav extends StatefulWidget {
  const bottomNav({Key? key}) : super(key: key);
  // bottomNav({this.parseLoginData});
  // final dynamic parseLoginData;
  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {
  int _selectedIndex = 0;
  final List<Widget> _children = <Widget>[
    HomePage2(),
    Board_main(),
    board1(),
    alarmPage(),
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'no',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'no',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined),
              label: 'no',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active),
              label: 'no',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'no',
            ),
          ],
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
      )
    );
  }
}
