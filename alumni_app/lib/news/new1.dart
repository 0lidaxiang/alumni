import 'package:dynamic_list_view/DynamicListView.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class News1Page extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<News1Page> {
   final title = '新闻速报 - 下拉加载版本';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: Container(
          child: DynamicListView.build(
            itemBuilder: _itemBuilder,
            dataRequester: _dataRequester,
            initRequester: _initRequester,
          ),
        ),
      ),
    );
  }

  Future<List> _initRequester() async {
    // 初始化请求
    // return Future.value(List.generate(12, (i) => i));
    List list= List();
      list.add("new init 1");
      list.add("new init 2");
      list.add("new init 3");
      list.add("new init 4");
      list.add("new init 5");
      list.add("new init 6");
      list.add("new init 6");
      list.add("new init 6");
      list.add("new init 6");
      list.add("new init 6");
      list.add("new init 6");
      list.add("new init 6");
      return list;
  }

  Future<List> _dataRequester() async {
    // 上拉加载新内容
    return Future.delayed(Duration(seconds: 1), () {
      List list= List();
      list.add("new load 1");
      list.add("new load 2");
      return list;
    });
  }

  Function _itemBuilder = (List dataList, BuildContext context, int index) {
    
    String title = dataList[index].toString();
    return ListTile(title: Text("$title"));
  };
}