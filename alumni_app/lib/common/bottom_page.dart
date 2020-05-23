import 'package:Alumni/login/login.dart';
import 'package:Alumni/my/my_page.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  _BottomState createState() => _BottomState( );
}

class _BottomState extends State<Bottom> {
//  final _BottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();
  @override
  void initState(){
    list
      ..add(Login())
      ..add(MinePage("sss"))
      ..add(MinePage("sss"))
      ..add(MinePage("sss"));
    super.initState();
  }

  // _BottomState( );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon:Icon(
                  Icons.home,
//                  color:_BottomNavigationColor,
                ),
                title:Text(
                    'Bottom',
//                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
            BottomNavigationBarItem(
                icon:Icon(
                  Icons.email,
//                  color:_BottomNavigationColor,
                ),
                title:Text(
                    'Email',
//                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
            BottomNavigationBarItem(
                icon:Icon(
                  Icons.pages,
//                  color:_BottomNavigationColor,
                ),
                title:Text(
                    'Pages',
//                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
            BottomNavigationBarItem(
                icon:Icon(
                  Icons.airplay,
//                  color:_BottomNavigationColor,
                ),
                title:Text(
                    'My',
//                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
          ],
          currentIndex:_currentIndex,
          onTap:(int index){
            setState((){
              _currentIndex= index;
            });
          },
          selectedItemColor: Colors.green,
//          unselectedItemColor: Colors.grey,
          type:BottomNavigationBarType.fixed
      ),
    );
  }
}