import 'package:flutter/material.dart';
import 'package:learn_ff/view_code.dart';

class ImageDemo extends StatelessWidget{

  ImageDemo({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    var _baseContent = '''
      Container(
            child: Column(
              children: <Widget>[
                Text('图片从Assets中加载:Image.asset'),
                Image.asset('images/yang.jpg'),
                Container(
                  height: 20.0,
                ),
                Image.asset('images/33.jpg'),
                Container(
                  height: 20.0,
                ),
                Text('图片从网络上加载:Image.network'),
                Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581273452606&di=886623cde13241b8c18ce0ab99d5d32d&imgtype=0&src=http%3A%2F%2Fimg.kutoo8.com%2Fupload%2Fimage%2F95351812%2F001%2520%25283%2529_960x540.jpg"),
                Container(
                  height: 20.0,
                ),

              ],
            ),
          )

    ''';

    return Scaffold(
      appBar: AppBar(
        title: Text("图片示例"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.rate_review),
            tooltip: '查看代码实现',
            onPressed: ()=> {
              Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return ViewCode(title: '图片组件代码实现', content: _baseContent);
                }
               )
              )
            }
          )
        ],
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: false,
          padding: EdgeInsets.all(10.0),
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: <Widget>[
                Text('图片从Assets中加载:Image.asset'),
                Image.asset('images/yang.jpg'),
                Container(
                  height: 20.0,
                ),
                Image.asset('images/33.jpg'),
                Container(
                  height: 20.0,
                ),
                Text('图片从网络上加载:Image.network'),
                Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581273452606&di=886623cde13241b8c18ce0ab99d5d32d&imgtype=0&src=http%3A%2F%2Fimg.kutoo8.com%2Fupload%2Fimage%2F95351812%2F001%2520%25283%2529_960x540.jpg"),
                Container(
                  height: 20.0,
                ),

              ],
            ),
          ),
      ),
    );
  }


}