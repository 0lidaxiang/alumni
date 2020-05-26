import 'package:flutter/material.dart';


enum SingingCharacter { 
  mechanical, electronic, chemistry, building,computer, design, other 
}

class DepartRadio extends StatefulWidget {
  @override
  _DepartRadioState createState() => new _DepartRadioState();
}

class _DepartRadioState extends State<DepartRadio> {
  SingingCharacter _character = SingingCharacter.mechanical;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RadioListTile<SingingCharacter>(
            value: SingingCharacter.mechanical,
            title: Text('mechanical'),
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
            value: SingingCharacter.electronic,
            title: Text('electronic'),
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              print(value);
              setState(() {
                _character = value;
              });
            },
          ),
          RadioListTile<SingingCharacter>(
            value: SingingCharacter.chemistry,
            title: Text('chemistry'),
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              print(value);
              setState(() {
                _character = value;
              });
            },
          ),
          RadioListTile<SingingCharacter>(
            value: SingingCharacter.building,
            title: Text('building'),
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              print(value);
              setState(() {
                _character = value;
              });
            },
          ),
          RadioListTile<SingingCharacter>(
            value: SingingCharacter.computer,
            title: Text('computer'),
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              print(value);
              setState(() {
                _character = value;
              });
            },
          ),
          RadioListTile<SingingCharacter>(
            value: SingingCharacter.design,
            title: Text('design'),
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              print(value);
              setState(() {
                _character = value;
              });
            },
          ),
          RadioListTile<SingingCharacter>(
            value: SingingCharacter.other,
            title: Text('other'),
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