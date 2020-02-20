import 'package:flutter/material.dart';
import 'package:learn_ff/view_code.dart';

import '../asset_utils.dart';

class ScaffoldDemo extends StatelessWidget{

  final List<Tab> tabs = <Tab>[
              Tab(text: '选项卡1'),
              Tab(text: '选项卡2'),
              Tab(text: '选项卡3'),
            ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold示例"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.rate_review),
            tooltip: '查看代码实现',
            onPressed: ()=> {
              AssetsUtils.loadAssetsString("doc/scaffold_demo.txt").then(
                (value){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return new ViewCode(title: 'Form组件代码实现', content: value);
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
      //当使用TabBar时需要在外层包裹一层DefaultTabController,用以组装TabBar及TabBarView
      body: DefaultTabController(
        length: 3, 
        child: Scaffold(
          appBar: AppBar(
            //通常为返回按钮,但也可以替换为其它按钮,一旦替换则返回功能失效
            leading: Icon(Icons.home),
            title: Text("标题"),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.add), onPressed: ()=>{
                  print("点击了appBar 加 按钮")
              }),
              IconButton(icon: Icon(Icons.search), onPressed: ()=>{
                  print("点击了appBar 搜索 按钮")
              }),
            ],
            bottom: TabBar(tabs: tabs),
          ),
          //设置背景色
          backgroundColor: Colors.cyanAccent,
          body: TabBarView(
            children: <Widget>[
              Center(
                child: Text("这是选项卡1的内容,由DefaultTabController按顺序绑定,这是第一个11111"), 
              ),
              Center(
                child: Text("这是选项卡2的内容,由DefaultTabController按顺序绑定,这是第二个22222"), 
              ),
              Center(
                child: Text("这是选项卡3的内容,由DefaultTabController按顺序绑定,这是第三个33333"), 
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.lock),
                title: Text('用户')
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                title: Text('信息')
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contacts),
                title: Text('通讯录')
              ),
            ],
            onTap: (index)=>{
              print("当前索引:$index")
            },
          )
        ),
      )
    );
  }

}