import 'package:flutter/material.dart';
import 'package:learn_ff/view_code.dart';

class WrapLayoutDemo extends StatelessWidget{

  WrapLayoutDemo({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var content = Center(
        child: Column(
          children: <Widget>[
            Text('Wrap布局是流布局,按顺序排列, 如果多出会另起一行排放'),
            Text('下面为示例:几个组件未作换行处理,但实际跑起来后,多出的组件自动换行'),
            Wrap(
                spacing: 8.0, //主轴水平方向间距
                runSpacing: 4.0,  //主轴垂直方向间距
                alignment: WrapAlignment.center,  //沿主轴方向剧中
                children: <Widget>[
                  Container(
                    width: 120.0,
                    height: 60.0,
                    color: Colors.redAccent,
                    child: Text('redAccent'),
                  ),
                  Container(
                    width: 120.0,
                    height: 60.0,
                    color: Colors.blueGrey,
                    child: Text('blueAccent'),
                  ),Container(
                    width: 60.0,
                    height: 60.0,
                    color: Colors.redAccent,
                    child: Text('redAccent'),
                  ),
                  Container(
                    width: 60.0,
                    height: 60.0,
                    color: Colors.blueGrey,
                    child: Text('blueAccent'),
                  ),
                  Container(
                    width: 60.0,
                    height: 60.0,
                    color: Colors.cyan,
                    child: Text('cyan'),
                  ),
                  Container(
                    width: 60.0,
                    height: 60.0,
                    color: Colors.deepPurpleAccent,
                    child: Text('deepPurpleAccent'),
                  ),
                ],
            )
          ],
        )
      );

    var contentStr = '''
      Center(
        child: Column(
          children: <Widget>[
            Text('Wrap布局是流布局,按顺序排列, 如果多出会另起一行排放'),
            Text('下面为示例:几个组件未作换行处理,但实际跑起来后,多出的组件自动换行'),
            Wrap(
                spacing: 8.0, //主轴水平方向间距
                runSpacing: 4.0,  //主轴垂直方向间距
                alignment: WrapAlignment.center,  //沿主轴方向剧中
                children: <Widget>[
                  Container(
                    width: 120.0,
                    height: 60.0,
                    color: Colors.redAccent,
                    child: Text('redAccent'),
                  ),
                  Container(
                    width: 120.0,
                    height: 60.0,
                    color: Colors.blueGrey,
                    child: Text('blueAccent'),
                  ),Container(
                    width: 60.0,
                    height: 60.0,
                    color: Colors.redAccent,
                    child: Text('redAccent'),
                  ),
                  Container(
                    width: 60.0,
                    height: 60.0,
                    color: Colors.blueGrey,
                    child: Text('blueAccent'),
                  ),
                  Container(
                    width: 60.0,
                    height: 60.0,
                    color: Colors.cyan,
                    child: Text('cyan'),
                  ),
                  Container(
                    width: 60.0,
                    height: 60.0,
                    color: Colors.deepPurpleAccent,
                    child: Text('deepPurpleAccent'),
                  ),
                ],
            )
          ],
        )
      );
    ''';

    return Scaffold(
        appBar: AppBar(
        title: Text("Wrap流布局示例"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.rate_review),
            tooltip: '查看代码实现',
            onPressed: ()=> {
              Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return ViewCode(title: '查看Wrap效果代码', content: '$contentStr');
                }
               )
              )
            }
          )
        ],
      ),
      body: content,
    );
  }

}