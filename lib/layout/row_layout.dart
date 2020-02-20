import 'package:flutter/material.dart';
import 'package:learn_ff/view_code.dart';

class RowLayoutDemo extends StatelessWidget{

  RowLayoutDemo({Key key}): super(key: key);

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
        child: Row(
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
            const Expanded(
               child: Text('为防止数据超出屏幕可以与Expanded一起使用,这样不论数据有多长都只会在固定的空间向下拉伸.'),
            ),
            
            const Expanded(
              child: Text('所有数据都存于一行上, 一旦屏幕不够用超出屏幕会报错..,Expanded与Container不能共用..'),
            ),
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
        child: Row(
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
            const Expanded(
               child: Text('为防止数据超出屏幕可以与Expanded一起使用,这样不论数据有多长都只会在固定的空间向下拉伸.'),
            ),
            const Expanded(
              child: Text('所有数据都存于一行上, 一旦屏幕不够用超出屏幕会报错..,Expanded与Container不能共用..'),
            ),
           ],
          ),
        );''';
    return Scaffold(
      appBar: AppBar(
        title: Text("Row布局示例"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.rate_review),
            tooltip: '查看代码实现',
            onPressed: ()=> {
              Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return ViewCode(title: '查看Row效果代码', content: '$contentStr');
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