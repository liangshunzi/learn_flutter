import 'package:flutter/material.dart';
import 'package:learn_ff/view_code.dart';

class AllLayoutDemo extends StatelessWidget{

  AllLayoutDemo({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    var contentStr = '''
      Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
                  width: size.width/6,
                  height: 80.0,
                  child: Icon(Icons.keyboard_arrow_left),
                ),
                Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
                  width: (size.width*4)/6,
                  height: 80.0,
                  child: Text('这是一个组合模拟Scaffold'),
                ),
                Container(
                  color: Colors.blue,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
                  width: size.width/6,
                  height: 80.0,
                  child: IconButton(icon: Icon(Icons.access_time), onPressed: ()=>{print('点击了!')}),
                )
              ],
            ),
            Container(
              // color: Colors.lightGreenAccent,
              height: size.height - 200.0,
              padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 2)
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('标题'),
                        ),
                        Expanded(
                          child: Text('年龄'),
                        ),
                        Expanded(
                          child: Text('名称'),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('武汉加油'),
                        ),
                        Expanded(
                          child: Text('2020'),
                        ),
                        Expanded(
                          child: Text('武汉加油中国加油'),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('中国加油'),
                        ),
                        Expanded(
                          child: Text('2020'),
                        ),
                        Expanded(
                          child: Text('武汉加油中国加油'),
                        ),
                      ],
                    ),
                    Image.asset('images/222.jpg')
                  ],
                )
              ),
            )
          ],
        ),
      )
    ''';
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("组合布局示例"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.rate_review),
            tooltip: '查看代码实现',
            onPressed: ()=> {
              Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return ViewCode(title: '查看组合效果代码', content: '$contentStr');
                }
               )
              )
            }
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
                  width: size.width/6,
                  height: 80.0,
                  child: Icon(Icons.keyboard_arrow_left),
                ),
                Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
                  width: (size.width*4)/6,
                  height: 80.0,
                  child: Text('这是一个组合模拟Scaffold'),
                ),
                Container(
                  color: Colors.blue,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
                  width: size.width/6,
                  height: 80.0,
                  child: IconButton(icon: Icon(Icons.access_time), onPressed: ()=>{print('点击了!')}),
                )
              ],
            ),
            Container(
              // color: Colors.lightGreenAccent,
              height: size.height - 200.0,
              padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 2)
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('标题'),
                        ),
                        Expanded(
                          child: Text('年龄'),
                        ),
                        Expanded(
                          child: Text('名称'),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('武汉加油'),
                        ),
                        Expanded(
                          child: Text('2020'),
                        ),
                        Expanded(
                          child: Text('武汉加油中国加油'),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('中国加油'),
                        ),
                        Expanded(
                          child: Text('2020'),
                        ),
                        Expanded(
                          child: Text('武汉加油中国加油'),
                        ),
                      ],
                    ),
                    Image.asset('images/222.jpg')
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }

}