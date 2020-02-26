import 'package:flutter/material.dart';
import 'package:learn_ff/db/user.dart';
import 'package:learn_ff/view_code.dart';

import '../asset_utils.dart';

class SqlfLiteDemo extends StatefulWidget{
  @override
  _SqlfLiteDemoState createState() {
    return new _SqlfLiteDemoState();
  }
}

class _SqlfLiteDemoState extends State<SqlfLiteDemo>{

  UserDbProvider db = new UserDbProvider();
  List<User> datas = new List();
  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController ageTextEditingController = new TextEditingController();

  @override
  void initState() {
    this._getMetaData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqlflite持久化操作示例"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.rate_review),
            tooltip: '查看代码实现',
            onPressed: ()=> {
              AssetsUtils.loadAssetsString("doc/sqlflite_demo.txt").then(
                (value){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return new ViewCode(title: 'sqlflite持久化代码实现', content: value);
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
        child: Container(
          color: Colors.blueGrey,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(25.0),
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: nameTextEditingController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          icon: Icon(Icons.account_circle),
                          labelText: "用户名称",
                        ),
                      ), 
                      TextField(
                        controller: ageTextEditingController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          icon: Icon(Icons.account_circle),
                          labelText: "年龄",
                        ),
                        onChanged: (value){
                          
                        },
                      ), 
                      Center(
                        child: FlatButton(
                          color: Colors.blue,
                          onPressed: ()=>{
                            this._add()
                          }, 
                          child: Text('新增', style: TextStyle(color:Colors.white),)
                        ),
                      ),
                    ],
                  ),  
                ),
              ),//Form
              Center(
                child: Text('从数据库中读取数据:',style: TextStyle(color: Colors.white, fontSize: 20),),
              ),
              //table
              Container(
                padding: EdgeInsets.all(30.0),
                color: Colors.blueGrey,
                child: Center(
                  child: Column(
                    children: _genData()
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _genData(){
    List<Widget> list = new List();
    var row = Row(
      children: <Widget>[
        Expanded(
          child: Text('ID')
        ),
        Expanded(
          child: Text('名称')
        ),
        Expanded(
          child: Text('年龄')
        ),
        Expanded(
          child: Text('操作')
        )
      ],
    );
    list.add(row);
    if(null != datas){
      //print('db: $value');
      if(datas.length > 0){
        for(int i=0; i<datas.length; i++){
          print(datas[i]);
          var row2 = Row(
            children: <Widget>[
              Expanded(
                child: Text(datas[i].id.toString())
              ),
              Expanded(
                child: Text(datas[i].name)
              ),
              Expanded(
                child: Text(datas[i].age.toString())
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.delete), 
                  onPressed: ()=>{
                    _delete(datas[i].id)
                  }
                )
              ),
            ],
          );
          list.add(row2);
        }
      }
    }else{
      list.add(Text('没有数据!'));
    }
    return list;
  }

  void _delete(int id){
    db.deleteUser(id).then((value){
      this._getMetaData();
    });
  }

  void _add(){
    print("name: "+nameTextEditingController.text);
    User user = User.of(nameTextEditingController.text, int.parse(ageTextEditingController.text));
    // user.name = nameTextEditingController.text;
    // user.age = int.parse(ageTextEditingController.text);
    db.addUser(user).then((value){
      this._getMetaData();
    });
  }

  _getMetaData(){
    db.queryAllUser().then((value){
      setState(() {
        datas = value;
        nameTextEditingController.text = '';
        ageTextEditingController.text = '0';
      });
    });
  }

}