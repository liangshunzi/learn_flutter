import 'package:flutter/material.dart';
import 'package:learn_ff/asset_utils.dart';
import 'package:learn_ff/button/button_demo.dart';
import 'package:learn_ff/form/form_demo.dart';
import 'package:learn_ff/image/image_demo.dart';
import 'package:learn_ff/layout.dart';
import 'package:learn_ff/view_code.dart';
import 'package:learn_ff/webview/webview_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContentShow(title: "Flutter 示例"),
   );
  }
}



class ContentShow extends StatelessWidget {

  ContentShow({Key key, this.title}):super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(this.title)),
        body: genListView(context),
      );
  }

  Widget genListView(BuildContext context){
      List<Widget> widgets = new List();
      widgets.add(new Center(
        child: ListTile(
          leading: new Icon(Icons.list),
          title: Text("Dart语法基础数据类型及操作"),
          trailing: new Icon(Icons.keyboard_arrow_right),
          onTap: ()=>listClick(context, "DART_BASE",),
        ),
        )
      );
      widgets.add(new Center(
        child: ListTile(
          leading: new Icon(Icons.list),
          title: Text("Dart类常见操作"),
          trailing: new Icon(Icons.keyboard_arrow_right),
          onTap: ()=>listClick(context, "DART_CLASS",),
        ),
        )
      );
      widgets.add(new Center(
        child: ListTile(
          leading: new Icon(Icons.list),
          title: Text("Dart方法常见操作"),
          trailing: new Icon(Icons.keyboard_arrow_right),
          onTap: ()=>listClick(context, "DART_METHOD",),
        ),
        )
      );
      widgets.add(new Center(
        child: ListTile(
          leading: new Icon(Icons.list),
          title: Text("Dart异步常见操作"),
          trailing: new Icon(Icons.keyboard_arrow_right),
          onTap: ()=>listClick(context, "DART_ASYNC",),
        ),
        )
      );
      widgets.add(new Center(
        child: ListTile(
          leading: new Icon(Icons.list),
          title: Text("按钮组件"),
          trailing: new Icon(Icons.keyboard_arrow_right),
          onTap: ()=>listClick(context, "BUTTON"),
        ),
        )
      );
      widgets.add(new Center(
        child: ListTile(
          leading: new Icon(Icons.list),
          title: Text("布局组件"),
          trailing: new Icon(Icons.keyboard_arrow_right),
          onTap: ()=>listClick(context, "LAYOUT"),
        ),
        )
      );
      widgets.add(new Center(
        child: ListTile(
          leading: new Icon(Icons.list),
          title: Text("图片组件"),
          trailing: new Icon(Icons.keyboard_arrow_right),
          onTap: ()=>listClick(context, "IMAGE"),
        ),
        )
      );
      widgets.add(new Center(
        child: ListTile(
          leading: new Icon(Icons.list),
          title: Text("Form组件"),
          trailing: new Icon(Icons.keyboard_arrow_right),
          onTap: ()=>listClick(context, "FORM"),
        ),
        )
      );
      widgets.add(new Center(
        child: ListTile(
          leading: new Icon(Icons.list),
          title: Text("WebView组件"),
          trailing: new Icon(Icons.keyboard_arrow_right),
          onTap: ()=>listClick(context, "WEBVIEW"),
        ),
        )
      );

      return new ListView(
        children: widgets,
      );
  }
  
  listClick(BuildContext context, String key){
    print("print key is $key");
    switch (key) {
      case "DART_BASE":
        AssetsUtils.loadAssetsString("doc/dart_base.txt").then(
          (value){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return new ViewCode(title: 'Dart基础数据类型及操作', content: value);
              }));
          }
        ).catchError(
          (error){
            print("error happened! $error");
          }
        );
        
        break;
      case "DART_CLASS":
        AssetsUtils.loadAssetsString("doc/dart_class.txt").then(
          (value){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return new ViewCode(title: 'Dart类常见操作', content: value);
              }));
          }
        ).catchError(
          (error){
            print("error happened! $error");
          }
        );
        break; 
      case "DART_METHOD":
        AssetsUtils.loadAssetsString("doc/dart_method.txt").then(
          (value){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return new ViewCode(title: 'Dart方法常见操作', content: value);
              }));
          }
        ).catchError(
          (error){
            print("error happened! $error");
          }
        );
        break;    
      case "DART_ASYNC":
        AssetsUtils.loadAssetsString("doc/dart_async.txt").then(
          (value){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return new ViewCode(title: 'Dart异步常见操作', content: value);
              }));
          }
        ).catchError(
          (error){
            print("error happened! $error");
          }
        );
        break;  
      case "BUTTON":
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return new ButtonDemo();
        }));
        break;  
      case "LAYOUT":
        //to layout
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return new LayoutDemo();
        }));
        break;
      case "IMAGE":
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return new ImageDemo();
        }));
        break;
      case "FORM":
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return FormDemo();
        }));
        break;  
      case "WEBVIEW":
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return WebViewDemo();
        }));
        break; 
      default:
        print("Nothing Happened!");
    }
  }

}




