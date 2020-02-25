import 'package:flutter/material.dart';
import 'package:learn_ff/view_code.dart';

import '../asset_utils.dart';

class GesturedetectorDemo extends StatefulWidget{
  @override
  _GesturedetectorState createState() {
    return new _GesturedetectorState();
  }

}

class _GesturedetectorState extends State<GesturedetectorDemo>{

  String showContent = '请在屏幕上开始操作手势\n';

  void addContent(String content){
    if(showContent.split('\n').length > 50){
      setState(() {
        showContent = content + '\n';
      });
    }else{
      setState(() {
        showContent += content + '\n';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //手势识别
    return GestureDetector(
      onTap: ()=>{
        addContent('你单击了屏幕')
      },
      onDoubleTap: ()=>{
        addContent('你双击了屏幕')
      },
      onLongPress: ()=>{
        addContent('你长按了屏幕')
      },
      //参数details存放位置信息:DrapDownDetail(offset(123, 456))
      onVerticalDragStart: (details)=>{
        addContent('开始垂直滑动$details')
      },
      onVerticalDragUpdate: (details)=>{
        addContent('持续垂直滑动$details')
      },
      onVerticalDragEnd: (details)=>{
        addContent('结束垂直滑动$details')
      },
      onHorizontalDragStart: (details)=>{
        addContent('开始水平滑动$details')
      },
      onHorizontalDragUpdate: (details)=>{
        addContent('持续水平滑动$details')
      },
      onHorizontalDragEnd: (details)=>{
        addContent('结束水平滑动$details')
      },
      //缩放组件将被水平及垂直组件替代,如果都存在会报错
      // onScaleStart: (details)=>{
      //   addContent('缩放开始$details')
      // },
      // onScaleUpdate: (details)=>{
      //   addContent('持续缩放$details')
      // },
      // onScaleEnd: (details)=>{
      //   addContent('结束缩放$details')
      // },
      child: Scaffold(
        appBar: AppBar(
          title: Text("手势组件示例"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.rate_review),
              tooltip: '查看代码实现',
              onPressed: ()=> {
                AssetsUtils.loadAssetsString("doc/gesture_demo.txt").then(
                  (value){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return new ViewCode(title: '手势组件代码实现', content: value);
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
          color: Colors.blueGrey,
          child: Center(
            child: Text(showContent),
          ),
        ),
      ),
    );
  }

}