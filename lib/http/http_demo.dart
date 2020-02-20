import 'package:flutter/material.dart';
import 'package:learn_ff/view_code.dart';
import 'package:http/http.dart' as http;

import '../asset_utils.dart';

class HttpDemo extends StatefulWidget{
  @override
  _HttpDemoState createState() {
    return _HttpDemoState();
  }

}

class _HttpDemoState extends State<HttpDemo>{

  String url = "https://swapi.co/api/";
  TextEditingController textEditingController = new TextEditingController();
  String content = "";

  @override
  void initState(){
    super.initState();
    textEditingController.text = url;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Http示例"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.rate_review),
            tooltip: '查看代码实现',
            onPressed: ()=> {
               AssetsUtils.loadAssetsString("doc/http_demo.txt").then(
                (value){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return new ViewCode(title: 'Http请求代码实现', content: value);
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('URL: '),
                  Flexible(
                    child: TextField(
                      controller: textEditingController,
                      keyboardType: TextInputType.text,
                    )
                  ),
                  FlatButton(
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: ()=> {
                      _getMetaData()
                    }, 
                    child: Text('点击请求')
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(15.0),
                child: Text(content, style: TextStyle(
                  color: Colors.blueGrey
                ),),
              ),
          ],
        ), 
      ),
    );
  }

  _getMetaData() async {
    this.setState((){
      this.content = "loading...";
    });
    var response = await http.get(textEditingController.text);
    if (response.statusCode == 200) {
      var body = response.body;
      print("content:$body");
      setState(() {
        this.content = body;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
