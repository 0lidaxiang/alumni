import 'dart:io';

import 'package:Alumni/register/forget_password_page.dart';
import 'package:Alumni/register/register_page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:Alumni/home/home_page.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  _Login createState() => new _Login();
}

class _Login extends State<Login> {
  //获取Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();
  String userName;
  String password;
  bool isShowPassWord = false;

  Future<void> login() async {
    var loginForm = loginKey.currentState;
    loginForm.save();
    print('userName: ' + userName + ' password: ' + password);
    Navigator.push(context, 
      MaterialPageRoute(builder:
       (context) =>Home()));
  }
  
  // 请求网络的login
  Future<void> login1() async {
    //读取当前的Form状态
    var loginForm = loginKey.currentState;
    //验证Form表单
    if(loginForm.validate()){
      loginForm.save();
      print('userName: ' + userName + ' password: ' + password);
      //请求远程服务 
      var url = 'https://www.baidu.com';
      var httpClient = new HttpClient();
      print(url);
      String result;
      try {
        var request = await httpClient.getUrl(Uri.parse(url));
        var response = await request.close();
        if (response.statusCode == HttpStatus.OK) {
          var json = await response.transform(utf8.decoder).join();
          var data = jsonDecode(json);
          result = data['origin'];
        } else {
          result =
              'Error getting IP address:\nHttp status ${response.statusCode}';
        }
      } catch (exception) {
        result = 'Failed getting IP address';
      }
      print("result: " + result);

      // If the widget was removed from the tree while the message was in flight,
      // we want to discard the reply rather than calling setState to update our
      // non-existent appearance.
      if (!mounted) return;

    }
  }

  void showPassWord() {
    setState(() {
      isShowPassWord = !isShowPassWord;
    });
  }
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Form表单示例',
      home: new Scaffold(
        body: new Column(
          children: <Widget>[
            new Container(
                padding: EdgeInsets.only(top: 100.0, bottom: 10.0),
                child: new Text(
                  'NTUST ALUMINS 登录',
                  style: TextStyle(
                      color: Color.fromARGB(255, 53, 53, 53),
                      fontSize: 30.0
                  ),
                )
            ),
            new Container(
              padding: const EdgeInsets.all(16.0),
              child: new Form(
                key: loginKey,
                autovalidate: true,
                child: new Column(
                  children: <Widget>[
                    new Container(
                      decoration: new BoxDecoration(
                          border: new Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 240, 240, 240),
                                  width: 1.0
                              )
                          )
                      ),
                      child: new TextFormField(
                        decoration: new InputDecoration(
                          labelText: '请输入手机号',
                          labelStyle: new TextStyle( fontSize: 15.0, color: Color.fromARGB(255, 93, 93, 93)),
                          border: InputBorder.none,
                          // suffixIcon: new IconButton(
                          //   icon: new Icon(
                          //     Icons.close,
                          //     color: Color.fromARGB(255, 126, 126, 126),
                          //   ),
                          //   onPressed: () {

                          //   },
                          // ),
                        ),
                        keyboardType: TextInputType.phone,
                        onSaved: (value) {
                          userName = value;
                        },
                        validator: (phone) {
                          // if(phone.length == 0){
                          //   return '请输入手机号';
                          // }
                        },
                        onFieldSubmitted: (value) {

                        },
                      ),
                    ),
                    new Container(
                      decoration: new BoxDecoration(
                          border: new Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 240, 240, 240),
                                  width: 1.0
                              )
                          )
                      ),
                      child: new TextFormField(
                        decoration:  new InputDecoration(
                            labelText: '请输入密码',
                            labelStyle: new TextStyle( fontSize: 15.0, color: Color.fromARGB(255, 93, 93, 93)),
                            border: InputBorder.none,
                            suffixIcon: new IconButton(
                              icon: new Icon(
                                isShowPassWord ? Icons.visibility : Icons.visibility_off,
                                color: Color.fromARGB(255, 126, 126, 126),
                              ),
                              onPressed: showPassWord,
                            )
                        ),
                        obscureText: !isShowPassWord,
                        onSaved: (value) {
                          password = value;
                        },
                      ),
                    ),
                    new Container(
                      height: 45.0,
                      margin: EdgeInsets.only(top: 40.0),
                      child: new SizedBox.expand(
                        child: new RaisedButton(
                          onPressed: login,
                          color: Color.fromARGB(255, 61, 203, 128),
                          child: new Text(
                            '登录',
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 255, 255, 255)
                            ),
                          ),
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(45.0)),
                        ),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 30.0),
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Container(
                            child:  
                            GestureDetector(
                              child: Text(
                                '注册账号',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color: Color.fromARGB(255, 53, 53, 53)
                                ),
                              ),
                              onTap:(){
                                print("register");
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>Register()));
                              },
                            ),
                          ),
                      new Container(
                          child : GestureDetector(
                            child: Text(
                            '忘记密码？',
                            style: TextStyle(
                                fontSize: 13.0,
                                color: Color.fromARGB(255, 53, 53, 53)
                            ),
                          ),
                          onTap : (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>ForgetPassword()));
                          },
                          ),
                          ),
                        ],
                      ) ,
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}