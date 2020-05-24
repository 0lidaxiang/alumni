import 'package:Alumni/common/bottom_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alumins',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: BottomPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
        child: new Icon(Icons.computer),
        onPressed: (){
          Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new BottomPage())
          );
        },
      ),

    );
  }
}
