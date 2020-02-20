import 'package:flutter/material.dart';
import 'package:learn_ff/view_code.dart';

class StackLayoutDemo extends StatelessWidget{

  StackLayoutDemo({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    var contentStr = '''
    ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              color: Colors.redAccent,
              width: 120,
              height: 40,
              child: Text('居中'),
            ),
            Positioned(
              left: 20,
              width: 120,
              height: 40,
              child: Text('left 20'),
            ),
            Positioned(
              top: 20,
              width: 120,
              height: 40,
              child: Container(
                color: Colors.redAccent,
                child: Text('Top20'),
              ),
            ),
            Positioned(
              top: 35,
              left: 35,
              width: 120,
              height: 40,
              child: Container(
                color: Colors.blueGrey,
                child: Text('Top35 Left35'),
              ),
            ),
            Positioned(
              top: 80,
              left: 35,
              width: 300,
              height: 200,
              child: Container(
                color: Colors.lightGreenAccent,
                child: Column(
                  children: <Widget>[
                    Text('Stack 层叠布局类似绝对定位布局与Positioned(相对于Stack四角定位)共用'),
                    Text('Positioned只有在Stack下才会生效,即类似html中position:absolute'),
                    Text('只有在position:absolute下 top left 属性才能生效')
                  ],
                ),
              ),
            )
          ],
        ),
      )
     ''';

    return Scaffold(
        appBar: AppBar(
        title: Text("Stack层布局示例"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.rate_review),
            tooltip: '查看代码实现',
            onPressed: ()=> {
              Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return ViewCode(title: '查看Stack效果代码', content: '$contentStr');
                }
               )
              )
            }
          )
        ],
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              color: Colors.redAccent,
              width: 120,
              height: 40,
              child: Text('居中'),
            ),
            Positioned(
              left: 20,
              width: 120,
              height: 40,
              child: Text('left 20'),
            ),
            Positioned(
              top: 20,
              width: 120,
              height: 40,
              child: Container(
                color: Colors.redAccent,
                child: Text('Top20'),
              ),
            ),
            Positioned(
              top: 35,
              left: 35,
              width: 120,
              height: 40,
              child: Container(
                color: Colors.blueGrey,
                child: Text('Top35 Left35'),
              ),
            ),
            Positioned(
              top: 80,
              left: 35,
              width: 300,
              height: 200,
              child: Container(
                color: Colors.lightGreenAccent,
                child: Column(
                  children: <Widget>[
                    Text('Stack 层叠布局类似绝对定位布局与Positioned(相对于Stack四角定位)共用'),
                    Text('Positioned只有在Stack下才会生效,即类似html中position:absolute'),
                    Text('只有在position:absolute下 top left 属性才能生效')
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }

}