import 'package:flutter/material.dart';
import 'package:learn_ff/view_code.dart';

import '../asset_utils.dart';

class ButtonDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('按钮组件'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.rate_review),
            tooltip: '查看代码实现',
            onPressed: ()=> {
              AssetsUtils.loadAssetsString("doc/button_demo.txt").then(
                (value){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return new ViewCode(title: 'Button组件代码实现', content: value);
                    }));
                }
              ).catchError(
                (error){
                  print("error happened! $error");
                }
              )
            }
          )
        ],
      ),
      body: Container(
       child: Column(
         children: <Widget>[
            Center(
              child: Text('MaterialButton(普通,可改主题):', style: TextStyle(fontSize: 40, color: Colors.blueGrey),),
            ),
            Center(
              child: MaterialButton(
                child: Text('没有背景'),
                onPressed: ()=>{
                  print('点击了MaterialButton')
                }
              ),
            ),
            Center(
              child: MaterialButton(
                color: Colors.blueAccent,
                textColor: Colors.white,
                child: Text('蓝色背景,白色文字'),
                onPressed: ()=>{
                  print('点击了MaterialButton')
                }
              ),
            ),
            Center(
              child: MaterialButton(
                padding: EdgeInsets.all(15.0),
                color: Colors.blueAccent,
                textColor: Colors.white,
                child: Text('Padding 15.0'),
                onPressed: ()=>{
                  print('点击了MaterialButton')
                }
              ),
            ),
            Center(
              child: MaterialButton(
                padding: EdgeInsets.all(15.0),
                color: Colors.blueAccent,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Text('圆角'),
                onPressed: ()=>{
                  print('点击了MaterialButton')
                }
              ),
            ),
            Center(
              child: Text('RaisedButton(有阴影,圆角):', style: TextStyle(color: Colors.blueGrey),),
            ),
            Center(
              child: RaisedButton(
                child: Text('RaisedButton'),
                onPressed: ()=>{
                  print('点击了RaisedButton')
                }
              ),
            ),
            Center(
              child: Text('FlatButton(没有阴影 没有圆角 没有边框 ，背景透明):', style: TextStyle(color: Colors.blueGrey),),
            ),
            Center(
              child: FlatButton(
                child: Text('FlatButton'),
                onPressed: ()=>{
                  print('点击了FlatButton')
                }
              ),
            ),
            Center(
              child: Text('OutlineButton(没有阴影 ， 有圆角边框的):', style: TextStyle(color: Colors.blueGrey),),
            ),
            Center(
              child: OutlineButton(
                child: Text('OutlineButton'),
                onPressed: ()=>{
                  print('点击了OutlineButton')
                }
              ),
            ),
            Center(
              child: Text('IconButton(图标按钮):', style: TextStyle(color: Colors.blueGrey),),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.lock),
                    onPressed: ()=>{
                      print('点击了IconButton')
                    }
                  ),
                  BackButton(
                    onPressed: ()=>{
                       print('点击了BackButton')
                    },
                  ),
                  CloseButton(
                    
                  ),
                ],
              )
            ),

         ],
       ), 
      ),
    );
  }

}
