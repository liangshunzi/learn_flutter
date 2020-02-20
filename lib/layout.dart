import 'package:flutter/material.dart';
import 'package:learn_ff/layout/all_layout.dart';
import 'package:learn_ff/layout/column_layout.dart';
import 'package:learn_ff/layout/row_layout.dart';
import 'package:learn_ff/layout/scaffold_demo.dart';
import 'package:learn_ff/layout/stack_layout.dart';
import 'package:learn_ff/layout/wrap_layout.dart';

class LayoutDemo extends StatelessWidget{

  LayoutDemo({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('布局详解'),),
      body: genListView(context),
    );
  }

  Widget genListView(BuildContext context){
      List<Widget> widgets = new List();
      var icon = new Icon(Icons.list);
      widgets.add(new Center(
        child: ListTile(
          leading: icon,
          title: Text("行布局ROW"),
          trailing: new Icon(Icons.keyboard_arrow_right),
          onTap: ()=>listClick(context, "ROW"),
        ),
        )
      );
      widgets.add(new Center(
        child: ListTile(
          leading: icon,
          title: Text("列布局COLUMN"),
          trailing: new Icon(Icons.keyboard_arrow_right),
          onTap: ()=>listClick(context, "COLUMN"),
        ),
        )
      );
      widgets.add(new Center(
        child: ListTile(
          leading: icon,
          title: Text("流布局Wrap"),
          trailing: new Icon(Icons.keyboard_arrow_right),
          onTap: ()=>listClick(context, "WRAP"),
        ),
        )
      );
      widgets.add(new Center(
        child: ListTile(
          leading: icon,
          title: Text("层布局Stack"),
          trailing: new Icon(Icons.keyboard_arrow_right),
          onTap: ()=>listClick(context, "STACK"),
        ),
        )
      );
      widgets.add(new Center(
        child: ListTile(
          leading: new Icon(Icons.list),
          title: Text("组合布局"),
          trailing: new Icon(Icons.keyboard_arrow_right),
          onTap: ()=>listClick(context, "ALL"),
        ),
        )
      );
      widgets.add(new Center(
        child: ListTile(
          leading: new Icon(Icons.list),
          title: Text("Scaffold"),
          trailing: new Icon(Icons.keyboard_arrow_right),
          onTap: ()=>listClick(context, "SCAFFOLD"),
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
      case "ROW":
        //to layout
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return new RowLayoutDemo();
        }));
        break;
      case "COLUMN":
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return new ColumnLayoutDemo();
        }));
        break;
      case "WRAP":
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return new WrapLayoutDemo();
        }));
        break;  
      case "STACK":
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return new StackLayoutDemo();
        }));
        break;  
      case "ALL":
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return new AllLayoutDemo();
        }));
        break;  
      case "SCAFFOLD":
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return new ScaffoldDemo();
        }));
        break; 
      default:
        print("Nothing Happened!");
    }
  }

}