import 'package:flutter/material.dart';
//이용구

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExPage(),
    );
  }
}

class ExPage extends StatefulWidget {
  const ExPage({Key? key}) : super(key: key);

  @override
  State<ExPage> createState() => _ExPageState();
}

class _ExPageState extends State<ExPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          items: const[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'list'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'setting'
            ),


          ]),

    );
  }
}

class Expage2 extends StatefulWidget {
  const Expage2({Key? key}) : super(key: key);

  @override
  State<Expage2> createState() => _Expage2State();
}

class _Expage2State extends State<Expage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('너 내 동료'),
      ),
      body: Container(

        margin: EdgeInsets.symmetric(vertical: 20.0),

        height: 200.0,

        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 160.0,
              color: Colors.red,
            ),
            Container(
              width: 160.0,
              color: Colors.blue,
            ),
            Container(
              width: 160.0,
              color: Colors.green,
            ),
            Container(
              width: 160.0,
              color: Colors.yellow,
            ),
            Container(
              width: 160.0,
              color: Colors.orange,
            )
          ],
        ),
      ),
    );
  }
}
