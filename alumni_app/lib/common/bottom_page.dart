import 'package:Alumni/activity/activity_list_page.dart';
import 'package:Alumni/activity/join_acitivity_page.dart';
import 'package:Alumni/login/login.dart';
import 'package:Alumni/my/my_page.dart';
import 'package:Alumni/news/news_list_page.dart';
import 'package:Alumni/questionnaire/questionnaire_page.dart';
import 'package:flutter/material.dart';



class BottomPage extends StatefulWidget {
  _BottomState createState() => _BottomState( );
}

class _BottomState extends State<BottomPage> {
//  final _BottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();
  @override
  void initState(){
    list
      ..add(NewsPage())
      ..add(ApplyActivityPage())
      ..add(ActivityListPage())
      ..add(MinePage("sss"))
      ..add(Login());
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
                    'Home',
//                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
            BottomNavigationBarItem(
                icon:Icon(
                  Icons.open_in_new,
//                  color:_BottomNavigationColor,
                ),
                title:Text(
                    'Apply',
//                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
            BottomNavigationBarItem(
                icon:Icon(
                  Icons.new_releases,
//                  color:_BottomNavigationColor,
                ),
                title:Text(
                    'ActivityList',
//                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
            BottomNavigationBarItem(
                icon:Icon(
                  Icons.account_box,
//                  color:_BottomNavigationColor,
                ),
                title:Text(
                    'My',
//                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
             BottomNavigationBarItem(
                icon:Icon(
                  Icons.account_circle,
//                  color:_BottomNavigationColor,
                ),
                title:Text(
                    'Login',
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