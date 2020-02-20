import 'package:flutter/material.dart';
import 'package:learn_ff/view_code.dart';

class ColumnLayoutDemo extends StatelessWidget{

  ColumnLayoutDemo({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    var content = Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          border: Border.all(color: Colors.yellowAccent, style: BorderStyle.solid, width: 5),
          // borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
          textBaseline: TextBaseline.ideographic,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.yellowAccent, style: BorderStyle.solid, width: 2)
              ),
              child: const FlutterLogo(),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.yellowAccent, style: BorderStyle.solid, width: 2)
              ),
              child: Icon(Icons.view_list),
            ),
            Text('每一个组件都占用一行记录....'),
            Text('竖屏超出部分亦会报错'),
            Image.asset('images/lion.png'),
            Image.asset('images/row_column.png'),
           ],
          ),
        );
    var contentStr = '''Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          border: Border.all(color: Colors.yellowAccent, style: BorderStyle.solid, width: 5),
          // borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
          textBaseline: TextBaseline.ideographic,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.yellowAccent, style: BorderStyle.solid, width: 2)
              ),
              child: const FlutterLogo(),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.yellowAccent, style: BorderStyle.solid, width: 2)
              ),
              child: Icon(Icons.view_list),
            ),
            Text('每一个组件都占用一行记录....'),
            Text('竖屏超出部分亦会报错'),
            Image.asset('images/lion.png'),
            Image.asset('images/yang.jpg'),
           ],
          ),
        );''';
    return Scaffold(
      appBar: AppBar(
        title: Text("Column布局示例"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.rate_review),
            tooltip: '查看代码实现',
            onPressed: ()=> {
              Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return ViewCode(title: '查看Column效果代码', content: '$contentStr');
                }
               )
              )
            }
          )
        ],
      ),
      body: content
    );
  }

}