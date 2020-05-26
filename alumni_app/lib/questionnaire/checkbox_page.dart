import 'package:flutter/material.dart';

class FoodCheckbox extends StatefulWidget {
  @override
  _CheckboxDemoState createState() => new _CheckboxDemoState();
}

class _CheckboxDemoState extends State<FoodCheckbox> {
  bool suCheckboxSelected = false;
  bool hunCheckboxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      new Container(
        margin: EdgeInsets.only(top: 30.0),
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: new Row(
         
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Container(
              child: Text(
                '食物选择',
                style: TextStyle(
                    fontSize: 16.0, color: Color.fromARGB(255, 53, 53, 53)),
              ),
            ),
          ],
        ),
      ),
      // child: new Row(
      CheckboxListTile(
        value: suCheckboxSelected,
        title: Text('素'),
        activeColor: Colors.red,
        dense: true,
        selected: true,
        isThreeLine: false,
        // secondary: Icon(Icons.book),
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (value) {
          print(value);
          setState(() {
            suCheckboxSelected = value;
          });
        },
      ),
      CheckboxListTile(
        value: hunCheckboxSelected,
        title: Text('荤'),
        activeColor: Colors.red,
        dense: true,
        selected: false,
        isThreeLine: false,
        // secondary: Icon(Icons.book),
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (value) {
          print(value);
          setState(() {
            hunCheckboxSelected = value;
          });
        },
      ),
      //  ),
    ]);
  }
}
