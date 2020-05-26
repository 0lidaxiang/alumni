import 'package:Alumni/config/app_router.dart';
import 'package:flutter/material.dart';
 
// void main() => runApp(new MyApp());

const COLORS = [
  Color(0xFFEF7A85),
  Color(0xFFFF90B3),
  Color(0xFFFFC2E2),
  Color(0xFFB892FF),
  Color(0xFFB892FF)
];
 
 
class ActivityListPage extends StatefulWidget {
  ActivityListPage({Key key, this.title}) : super(key: key);
 
  final String title;
 
  @override
  _ActivityListPageState createState() => new _ActivityListPageState();
}
 
class _ActivityListPageState extends State<ActivityListPage> {
   final List<String> items = new List<String>.generate(20, (i) => "近期活动 $i");
  
  @override
  Widget build(BuildContext context) {
    final title = '活动列表';

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
              onTap: (){
                  print("活动 item " );
                  print(index);
                  var bodyJson = '{"activityName":' + index.toString() +'}';
                  // var bodyJson = index.toString();
                  router.navigateTo(context, '/apply/$bodyJson');
                  // Navigator.push(context, MaterialPageRoute(builder: (context) =>ApplyActivityPage(activityName: index.toString())));
              },
            );
          },
        ),
      ),
    );
  }

}
  