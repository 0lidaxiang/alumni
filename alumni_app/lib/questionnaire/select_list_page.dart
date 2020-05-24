import 'package:flutter/material.dart';

class DepartSelectList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DepartSelectList();
  }
}

class _DepartSelectList extends State<DepartSelectList> {
  List<String> _depts = <String>["mechanical", "electronic", "chemistry", "building", "computer", "design", "other"];
  String _dept;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
     _dept = _depts[0];
     print(_dept);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
              new Text ("系别:" )
          ],
        ),
        Column(
          children: <Widget>[
            DropdownButton<String>(
              value: _dept,
              isDense: true,
              isExpanded: true,
              hint: Text('请选择'),
              onChanged: (String newValue) {
                setState(() {
                  _dept = newValue;
                });
                print(_dept);
              },
              items: _depts.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ],
    );
  }
}
 