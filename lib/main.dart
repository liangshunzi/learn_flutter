import 'package:flutter/material.dart';
import 'package:learn_ff/asset_utils.dart';
import 'package:learn_ff/button/button_demo.dart';
import 'package:learn_ff/form/form_demo.dart';
import 'package:learn_ff/gesturedetector/gesturedetector_demo.dart';
import 'package:learn_ff/gridview/gridview_demo.dart';
import 'package:learn_ff/http/http_demo.dart';
import 'package:learn_ff/image/image_demo.dart';
import 'package:learn_ff/layout.dart';
import 'package:learn_ff/listview/listview_demo.dart';
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

  final Map<String,String> widgetsMap = {
    "DART_BASE":"Dart语法基础数据类型及操作",
    "DART_CLASS":"Dart类常见操作",
    "DART_METHOD":"Dart类常见操作",
    "DART_ASYNC":"Dart异步常见操作",
    "BUTTON":"按钮组件",
    "LAYOUT":"布局组件",
    "IMAGE":"图片组件",
    "FORM":"FORM组件",
    "WEBVIEW":"WEBVIEW组件",
    "HTTP":"Http请求",
    "LIST":"列表组件(下拉刷新上拉加载)",
    "GRID":"网络组件(下拉刷新上拉加载)",
    "GESTUREDETECTOR":"手势组件",
    "SQFLITE":"持久化sqflite操作",
    "HTTP2":"Http请求",
    "HTTP3":"Http请求",
    "HTTP4":"Http请求",
    "HTTP5":"Http请求",
    "HTTP6":"Http请求",
    "HTTP7":"Http请求",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(this.title)),
        body: genListView(context),
      );
  }

  Widget genListView(BuildContext context){
      List<Widget> widgets = new List();
      widgetsMap.forEach((String key, String value){
        var center = new Center(
          child: ListTile(
            leading: new Icon(Icons.list),
            title: Text(value),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: ()=>listClick(context, key,),
          ),
        );
        widgets.add(center);
      });

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
      case "HTTP":
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return HttpDemo();
        }));
        break; 
      case "LIST":
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ListViewDemo();
        }));
        break; 
      case 'GRID':
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return GridViewDemo();
        }));
        break;
      case 'GESTUREDETECTOR':
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return GesturedetectorDemo();
        }));
        break;
      default:
        print("Nothing Happened!");
    }
  }

}




