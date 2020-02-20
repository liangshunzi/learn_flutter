import 'package:flutter/material.dart';
import 'package:learn_ff/view_code.dart';

import '../asset_utils.dart';

class FormDemo extends StatefulWidget{

  FormDemo({Key key}): super(key: key);

  @override
  _FormDemoState createState() {
    return new _FormDemoState();
  }
}

class _FormDemoState extends State<FormDemo>{
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  String userName = '';
  String password = '';

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form示例"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.rate_review),
            tooltip: '查看代码实现',
            onPressed: ()=> {
              AssetsUtils.loadAssetsString("doc/form_demo.txt").then(
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
      //外层包裹GestureDetector是为了实现空白地方点击事件,当点击空白地方时隐藏可能弹出来的键盘
      body: GestureDetector(
        onTap: () {
          //该方法用于隐藏键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        //外层包裹SingleChildScrollView是为了解决当Column使用时需要弹出键盘,键盘挤到组件时会报错的问题
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Image.asset("images/huomao.jpeg"),
                    ),
                    Center(
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: TextField(
                              controller: this.userNameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5.0),
                                icon: Icon(Icons.account_circle),
                                labelText: "手机号/邮箱/用户名",
                                // helperText: "手机号/邮箱/用户名"
                              ),
                              onChanged: (value) => {
                                setState((){
                                    this.userName = value;
                                  }
                                )
                              },
                            ), 
                          ),
                          Center(
                            child: TextField(
                              controller: this.passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5.0),
                                icon: Icon(Icons.lock),
                                labelText: "请输入您的密码"
                              ),
                              onChanged: (value) => {
                                setState((){
                                  this.password = value;
                                })
                              },
                            ),
                          )  
                        ], 
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 120.0,
                          child: MaterialButton(
                            textColor: Colors.grey,
                            child: Text('忘记密码?'),
                            onPressed: ()=>{
                              print("点击了忘记密码!")
                            },
                          ),
                        ), 
                        Container(
                          
                        ),
                        Container(
                          width: 120.0,
                          child: MaterialButton(
                            textColor: Colors.blueAccent,
                            child: Text('注册>'),
                            onPressed: ()=>{
                              print("点击了注册按钮!")
                            },
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: MaterialButton(
                        minWidth: 360.0,
                        height: 60.0,
                        padding: EdgeInsets.all(5.0),
                        textColor: Colors.white,
                        color: Colors.orangeAccent,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Text('登录', style: TextStyle(fontSize: 20),),
                        onPressed: ()=>{
                          _login()
                        }
                      ),
                    ),
                    Container(
                      child: Text("帐号为: $userName"),
                    ),
                    Container(
                      child: Text("密码为: $password"),
                    )
                  ],
                ),
              )
            ),
          ),
        )

      )
    );
  }

  _login(){
    String name = this.userNameController.text;
    String password = this.passwordController.text;
    String content = "username: $name  password: $password";
    print(content);
    FocusScope.of(context).requestFocus(FocusNode());
    _alert(context, title: "你点击了登陆按钮", content: content);
  }

  Future _alert(BuildContext context, {String title, String content} ) async {
    showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content:Text(content),
          actions:<Widget>[
            FlatButton(
              child: Text('确认'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('取消'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
          // backgroundColor:Colors.yellowAccent,
          elevation: 20,
          // semanticLabel:'哈哈哈哈',
          // 设置成 圆角
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        );
      },
    );
  }

}