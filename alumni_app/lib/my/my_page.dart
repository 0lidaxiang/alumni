import 'package:Alumni/login/login.dart';
import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  var parentContext;
  MinePage(this.parentContext);

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: '测试',
      routes: <String, WidgetBuilder>{
//        "/routes":(BuildContext context) => new Routes(),
      },
      home: new MinePageWidget(parentContext),
    );
  }

  void greet(String message) {
    if (message!=null) {

    }
  }
}

class MinePageWidget extends StatefulWidget {
  var parentContext;
  MinePageWidget(this.parentContext);

  _PageState createState() => _PageState();
}

class _PageState extends State<MinePageWidget> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  // UserInfo _userInfo;

  void _requestData() async {
    // UserInfo userInfo = await PXRequest.px_getuser();
    print("userInfo.userName");
    // setState(() {
    //   _userInfo = userInfo;
    // });
  }

  @override
  void initState() {
    super.initState();
    _requestData();
  }

    Widget _cell(int row, IconData iconData, String title, String describe, bool isShowBottomLine) {
      // if(row == 5){
       
       
    return GestureDetector(
      onTap: () {
        switch (row) {
          case 0:
            print("$row -- $title");
            break;
          case 1:
            print("$row -- $title");
            break;
          case 2:
            print("$row -- $title");
            break;
          case 3:
            print("$row -- $title");
            break;
          case 4:
            print("$row -- $title");
            break;
        }
      },
      child: new Container(
        color: Color(0xffd5dede),
        height: 50.0,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
                margin: new EdgeInsets.all(0.0),
                height: (isShowBottomLine ? 49.0 : 50.0),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        margin: new EdgeInsets.only(left: 15.0),
                        child: new Row(
                          children: <Widget>[
                            new Icon(iconData, color: Color(0xffaaaaaa)),
                            new Container(
                              margin: new EdgeInsets.only(left: 15.0),
                              child: new Text(title, style: TextStyle( fontSize: 16.0)),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        child: new Row(
                          children: <Widget>[
                            new Text(describe, style: TextStyle(color: Colors.red, fontSize: 14.0)),
                            new Icon(Icons.keyboard_arrow_right ),
                          ],
                        ),
                      ),
                    ]
                )
            ),

            _bottomLine(isShowBottomLine),

          ],
        ),
      ),
    );
      // }
  }

  Widget _bottomLine(bool isShowBottomLine) {
    if (isShowBottomLine) {
     return new Container(
          margin: new EdgeInsets.all(0.0),
          child: new Divider(
              height: 1.0,
              color: Colors.blue
          ),
          padding: EdgeInsets.only(left: 15.0, right: 15.0)
      );
    }
    return Container();
  }

  Widget _spaceView() {
    return Container(
      height: 10.0,
      color: Colors.blue,
    );
  }

  Widget _topView(String name, String phone) {
    return new GestureDetector(
      onTap: () {
        print("修改头像、姓名、电话");
      },
      child: new Container(
        height: 180.0,
        color: Color(0xdde5efef),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Container(
              height: 40.0,
              width: 40.0,
              alignment: Alignment.center,
              margin: new EdgeInsets.only(right: 20.0, top: 10.0),
              child: new IconButton(
                  iconSize: 20.0,
                  icon: new Icon(Icons.new_releases, color: Color(0xffa3cdcd)),
                  onPressed: () {
                    print("查看消息");
                  }),
            ),
            new Container(
              height: 90.0,
              margin: new EdgeInsets.only(top: 20.0),
              color: Color(0xffF5EFEF),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                      padding: new EdgeInsets.only(left: 15.0),
                      child: new Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(new Radius.circular(35.0))
                        ),
                        child: new Image.asset("images/icon_tabbar_mine_normal.png", height: 70.0, width: 70.0),
                      )
                  ),
                  new Container(
                    margin: new EdgeInsets.only(left: 8.0, top: 25.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text( "sdfsdf"  , style: TextStyle(color: Colors.blue, fontSize: 18.0), textAlign: TextAlign.left),
                        new Text( "qqqqq"  , style: TextStyle(color: Colors.blue, fontSize: 12.0), textAlign: TextAlign.left),
                      ],
                    ),
                  ),
                  new Container(
                    child: new Icon(Icons.keyboard_arrow_right ),
                    margin: new EdgeInsets.only(left: MediaQuery.of(context).size.width/ 2 - 15.0),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Container(
        // color: Colors.black,
        height: MediaQuery.of(context).size.height,
        child: new ListView.builder(
          physics: new AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == 0) {
              return _topView("topView", "13146218612");
            } else if (index == 1) {
              return _cell(index, Icons.list, "修改密码", "username", true);
            } else if (index == 2) {
              return _cell(index, Icons.card_membership, "活动记录", "", true);
            }  else if (index == 3) {
              return _cell(index, Icons.title, "调查问卷", "", false);
            } else if (index == 4) {
              return _cell(index, Icons.help, "关于我们", "", true);
            }  else if (index == 5) {
               
              return _cell(index, Icons.help, "login", "", true);
            } 
            else {
              return new Container(
                height: MediaQuery.of(context).size.height,
                color: Color(0xfff5efef),
              );
            }
          },
          itemCount: 5 + 1,
        ),
      ),
    );
  }
}

 