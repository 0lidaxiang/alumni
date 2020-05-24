import 'dart:convert';

import 'package:Alumni/questionnaire/checkbox_page.dart';
import 'package:Alumni/questionnaire/gender_radio.dart';
import 'package:Alumni/questionnaire/select_list_page.dart';
import 'package:flutter/material.dart';

final String INIT_ACTIVITY_NAME = '{"activityName":"test"}';

class ApplyActivityPage extends StatefulWidget {
  String params;
  ApplyActivityPage(String params) {
    this.params = params;
  }

  @override
  _ApplyActivityPageState createState() =>
      new _ApplyActivityPageState(this.params);
}

class _ApplyActivityPageState extends State<ApplyActivityPage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String activityName;
  String _name;
  String _password;

  _ApplyActivityPageState(String params) {
    Map<String, dynamic> paramJson = json.decode(params);
    print(paramJson);
    print(paramJson['activityName']);
    // print(params["data"]);
    // this.activityName = params['data'][0];
    this.activityName = paramJson['activityName'].toString();
  }

  void _forSubmitted() {
    var _form = _formKey.currentState;

    if (_form.validate()) {
      _form.save();
      print(_name);
      print(_password);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter data',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('活动报名'),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: _forSubmitted,
          child: new Text('提交'),
        ),
        body: new Container(
          height: 600,
          padding: const EdgeInsets.all(16.0),
          child: new Form(
            key: _formKey,
            child: new Column(
              children: <Widget>[
                new Text("活动名称: " + this.activityName),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: '姓名',
                  ),
                  onSaved: (val) {
                    _name = val;
                  },
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: '毕业年份',
                  ),
                  onSaved: (val) {
                    _name = val;
                  },
                ),

                GenderRadio(),
                // DepartRadio(),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: '公司',
                  ),
                  onSaved: (val) {
                    _name = val;
                  },
                ),

                FoodCheckbox(),
                DepartSelectList(),
              ],
            ),
          ),
        ),
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}
