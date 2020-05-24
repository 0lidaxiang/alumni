import 'dart:math';
 
import 'package:Alumni/common/bottom_page.dart';
import 'package:flutter/material.dart';
 
 
var COLORS = [
  Color(0xFFEF7A85),
  Color(0xFFFF90B3),
  Color(0xFFFFC2E2),
  Color(0xFFB892FF),
  Color(0xFFB892FF)
];
 
 
class NewsPage extends StatefulWidget {
  NewsPage({Key key, this.title}) : super(key: key);
 
  final String title;
 
  @override
  _NewsPageState createState() => new _NewsPageState();
}
 
class _NewsPageState extends State<NewsPage> {
   final List<String> items = new List<String>.generate(30, (i) => "新闻 $i");
  
  @override
  Widget build(BuildContext context) {
    final title = '新闻速报';
   bottomNavigationBar: BottomPage();
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text('${items[index]}'),
            );
          },
        ),
      ),
    );
  }

}
  