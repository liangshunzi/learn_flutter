import 'package:flutter/material.dart';
import 'package:learn_ff/view_code.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewDemo extends StatelessWidget{

  String _baseContent = '''

    /***
     * 需要增加插件:flutter_webview_plugin: ^0.3.10+1
     * IOS版本需要个性info.plist文件
     * <key>NSAppTransportSecurity</key>
     *  <dict>
     *      <key>NSAllowsArbitraryLoads</key>
     *      <true/>
     *      <key>NSAllowsArbitraryLoadsInWebContent</key>
     *      <true/>
     *  </dict>
     * 
     ***/ 

    WebviewScaffold(
      url: "https://www.jianshu.com/p/8488b334926d",
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
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.redAccent,
        child: const Center(
          child: Text('Waiting.....'),
        ),
      ),
    );
  ''';

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://www.jianshu.com/p/8488b334926d",
      appBar: AppBar(
        title: Text("WebView示例"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.rate_review),
            tooltip: '查看代码实现',
            onPressed: ()=> {
              Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return ViewCode(title: 'WebView代码实现', content: _baseContent);
                }
               )
              )
            }
          )
        ],
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.redAccent,
        child: const Center(
          child: Text('Waiting.....'),
        ),
      ),
    );
  }


}