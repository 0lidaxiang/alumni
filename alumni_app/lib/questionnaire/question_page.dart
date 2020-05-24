import 'package:flutter/material.dart';

// void main() => runApp(new QuestionnairePage());

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => new _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
    // 详细信息 初始化默认为""
  Map questionnaireDetail = {
    "title": '',
    "startDate": '',
    "endDate": '',
    "remark": '',
  };

  // 列表视图（`ListView`）中要显示的数据。
  List questionList = new List();

  ScrollController _scrollController = new ScrollController();
 
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("问卷详情"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          //点击空白处取消TextField焦点 触摸收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: new ListView(
          shrinkWrap: true, //是否根据子widget的总长度来设置ListView的长度，默认值为false
          controller: _scrollController,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   new Text(
                    questionnaireDetail["title"],
                    overflow: TextOverflow.ellipsis, // 文字超长时显示为省略号...
                    maxLines: 2, // 设置最多显示两行文字
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1.0), //opacity：不透明度
                      fontFamily: 'PingFangBold',
                      fontSize: 15.0,
                    ),
                  ),
                  Container(
                    child: _buildList(),
                  ),
                 ],
              ),
            ),
         ],
        ),
      ),
    );
  }


  Widget _buildList() {
    return ListView.builder(
      shrinkWrap: true, //是否根据子widget的总长度来设置ListView的长度，默认值为false
      physics: new NeverScrollableScrollPhysics(), // 禁用问题列表子组件的滚动事件
      //itemCount +1 为了显示加载中和暂无数据progressbar
      itemCount: questionList.length + 1,
      itemBuilder: (context, index) {
          // 列表显示
          return Container(
            padding: new EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 new Text(
                  questionList[index]["title"]),
                Offstage(
                  // 控制 最多可选maxChoice项组件 是否隐藏
                  offstage: questionList[index]['questionType'] == "多选题" &&
                          questionList[index]["maxChoice"] != 0
                      ? false
                      : true,
                  child: new Text('(最多可选：' +
                      questionList[index]["maxChoice"].toString() +
                      "项)"),
                ),
                questionList[index]['questionType'] == "单选题"
                    ? _buildRadioChoiceRow(questionList[index])
                    : questionList[index]['questionType'] == "多选题"
                        ? _buildCheckboxChoiceRow(questionList[index],
                            questionList[index]["maxChoice"])
                        : _buildTextControllerRow(questionList[index]),
              ],
            ),
          );
          },
    );
  }
  // 构建 单选框Radio 单选题选项列表 组件
  Widget _buildRadioChoiceRow(question) {
    return new ListView.builder(
      physics: new NeverScrollableScrollPhysics(), // 禁用选项列表子组件的滚动事件
      shrinkWrap: true, //是否根据子widget的总长度来设置ListView的长度，默认值为false
      itemCount: question['options'].length,
      itemBuilder: (context, index) {
        var optionContent = question['options'][index]["optionContent"];
        if (optionContent.indexOf("#OTHER#") == -1) {
          // print('不是其他: ' + optionContent.indexOf("#OTHER#").toString());
          return _radioListItem(question, optionContent, index, optionContent);
        } else {
          // 其他选项 带输入框
          var radioTitle = optionContent.replaceAll("#OTHER#", "");
          // print('其他的文字: ' + radioTitle);
          // print('其他: ' + optionContent.indexOf("#OTHER#").toString());
          return Row(
            children: <Widget>[
              Container(
                width: 150,
                child:
                    _radioListItem(question, optionContent, index, radioTitle),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 200,
                color: const Color(0xFFFFFFFF),
                // 其他选项  输入框
                child: _buildTextOtherController(question),
              )
            ],
          );
        }
      },
    );
  }
  Widget _radioListItem(question, optionContent, optionIndex, radioTitle) {
    return new Row(
      children: <Widget>[
        // 此处也可以使用RadioListTile，但是这个组件不满足我们这边的需求，所以自己后来写了布局
        new Radio(
          value: question['options'][optionIndex]['id'], // 该值为string类型
          groupValue: question['groupValue'], // 与value一样是选中
          onChanged: (val) {
            // 收起键盘
            FocusScope.of(context).requestFocus(FocusNode());
            setState(() {
              question['groupValue'] = val;
              // print('选中了: ' + val.toString());
            });
          },
        ),
        Expanded( // Row的子元素Text实现换行 需要加Expanded
          child: Text(
            radioTitle,
            softWrap: true, // 自动换行
          ),
        ),
      ],
    );
  }
  // 构建 复选框Checkbox 多选题选项列表 组件
  Widget _buildCheckboxChoiceRow(question, maxChoice) {
    return new ListView.builder(
      physics: new NeverScrollableScrollPhysics(), // 禁用选项列表子组件的滚动事件
      shrinkWrap: true, //是否根据子widget的总长度来设置ListView的长度，默认值为false
      itemCount: question['options'].length,
      itemBuilder: (context, index) {
        var optionContent = question['options'][index]["optionContent"];

        if (optionContent.indexOf("#OTHER#") == -1) {
          return _checkboxListItem(
              question, maxChoice, optionContent, index, optionContent);
        } else {
          // 其他选项 带输入框
          var checkboxTitle = optionContent.replaceAll("#OTHER#", "");
          // print('其他的文字: ' + checkboxTitle);
          return new Row(
            children: <Widget>[
              Container(
                width: 150,
                child: _checkboxListItem(
                    question, maxChoice, optionContent, index, checkboxTitle),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 200,
                color: const Color(0xFFFFFFFF),
                // 其他选项  输入框
                child: _buildTextOtherController(question),
              )
            ],
          );
        }
      },
    );
  }
  Widget _checkboxListItem(
      question, maxChoice, optionContent, optionIndex, checkboxTitle) {
    return new Row(
      children: <Widget>[
        // 此处也可以使用CheckboxListTile，但是这个组件不满足我们这边的需求，所以后来自己写了布局
        Checkbox(
          value: question['options'][optionIndex]
              ['isCheck'], // 该值为bool类型 false即不选中
          onChanged: (isCheck) {
            // 收起键盘
            FocusScope.of(context).requestFocus(FocusNode());
            _checkMaxChoise(question, maxChoice, optionIndex, isCheck);
          },
        ),       
        Expanded( // Row的子元素Text实现换行 需要加Expanded
          child: Text(
            checkboxTitle,
            softWrap: true, // 自动换行
          ),
        ),
      ],
    );
  }
  // 多选题 判断maxChoice最多选择项的逻辑
  void _checkMaxChoise(question, maxChoice, optionIndex, isCheck) {
    setState(() {
      var optionId = question['options'][optionIndex]['id'];
      question['options'][optionIndex]['isCheck'] = isCheck;
      if (isCheck) {
        // print('选中了: ' + optionId);
        question['checked'].add(optionId);
        if (maxChoice != 0 && question['checked'].length > maxChoice) {
          question['checked'].remove(optionId);
          question['options'][optionIndex]['isCheck'] = false;
          print("当前选中数已超过本题的最大选项数");
        }
        // print('选中的: ' + question['checked'].toString());
      } else {
        question['checked'].remove(optionId);
        // print('选中的: ' + question['checked'].toString());
      }
    });
  }
  // 构建 输入框行 简答题 组件
  Widget _buildTextControllerRow(question) {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: const Color(0xFFFFFFFF),
        padding: EdgeInsets.only(left: 8.0),
        child: _buildTextField(question['textController']),
    )
    );
  }
  // 构建 选项的其他输入框 组件
  Widget _buildTextOtherController(question) {
    return _buildTextField(question['textOtherController']);
  }
  // 构建 输入框 组件
  Widget _buildTextField(controller) {
    // 文本字段（`TextField`）组件，允许用户使用硬件键盘或屏幕键盘输入文本。
    return new TextField(
      cursorColor: const Color(0xFFFE7C30),
      cursorWidth: 2.0,
      keyboardType: TextInputType.multiline, //多行
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        // 圆角矩形的边框
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      controller: controller, // 控制正在编辑的文本
    );
  }
}