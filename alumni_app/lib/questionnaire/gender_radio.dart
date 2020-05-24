import 'package:Alumni/login/login.dart';
import 'package:Alumni/my/my_page.dart';
import 'package:Alumni/questionnaire/question_page.dart';
import 'package:Alumni/questionnaire/questionnaire_page.dart';
import 'package:flutter/material.dart';


enum SingingCharacter { man, woman }

class GenderRadio extends StatefulWidget {
  @override
  _GenderRadioState createState() => new _GenderRadioState();
}

class _GenderRadioState extends State<GenderRadio> {
  SingingCharacter _character = SingingCharacter.man;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RadioListTile<SingingCharacter>(
            value: SingingCharacter.man,
            title: Text('男'),
            groupValue: _character,
            activeColor: Colors.red,
            onChanged: (SingingCharacter value) {
              print(value);
              setState(() {
                _character = value;
              });
            },
          ),
          RadioListTile<SingingCharacter>(
            value: SingingCharacter.woman,
            title: Text('女'),
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              print(value);
              setState(() {
                _character = value;
              });
            },
          )
        ]
      )
    );
  }
}