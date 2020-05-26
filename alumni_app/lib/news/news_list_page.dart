import 'package:Alumni/common/bottom_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert' show jsonDecode;

const COLORS = [
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
  List<String> items = new List();

  _NewsPageState() {
    getRequest();
  }

  @override
  Widget build(BuildContext context) {
    final title = '新闻速报';
    BottomPage();
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

  void getRequest() async { 
    Dio dio = new Dio(); 
    // var response = await dio.get("/test?id=12&name=chen");
    var response = await dio
        .get("https://fms.csschina.com/merchant_css/runnerRest/getLiveOrders");

    // print(response.runtimeType.toString());
    // print(response.headers);

    var ll = jsonDecode(response.toString());

    if (ll != null && ll.length > 0) {
      items = new List<String>.generate(13, (i) => "新闻s $i");
      setState(() {
        items = new List<String>.generate(
            13,
            (i) =>
                "新闻error 新闻error 新闻error 新闻error 新闻error 新闻error 新闻error 新闻error 新闻error 新闻error $i");
      });

    } else {
      setState(() {
        items = new List<String>.generate(
            13,
            (i) =>
                "新闻error 新闻error 新闻error 新闻error 新闻error 新闻error 新闻error 新闻error 新闻error 新闻error $i");
      });
      print("error");
    }
  }
}
