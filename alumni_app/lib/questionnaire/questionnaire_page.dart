import 'package:Alumni/questionnaire/select_list_page.dart';
import 'package:flutter/material.dart';

import 'checkbox_page.dart';
import 'gender_radio.dart';
 

class QuestionnairePage extends StatefulWidget {
  @override
  _QuestionnairePageState createState() => new _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _name;

  String _password;

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