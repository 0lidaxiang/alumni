import 'package:Alumni/common/bottom_page.dart';
import 'package:Alumni/my/my_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'activity/activity_list_page.dart';
import 'activity/apply_acitivity_page.dart';
import 'config/app_router.dart';
import 'news/new1.dart';
import 'news/news_list_page.dart';

void main() {
  router.define('/', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new BottomPage();
  }));
  router.define('/home', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new NewsPage();
  }));
  router.define('/apply', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new ApplyActivityPage(INIT_ACTIVITY_NAME);
  }));
  router.define('apply/:data', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new ApplyActivityPage(params['data'][0]);
  }));
  router.define('/activityList', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new ActivityListPage();
  }));
  router.define('/my', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new MinePage("sss");
  }));
  router.define('/login', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new News1Page();
  }));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alumins',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomPage(),
    );
  }
}
