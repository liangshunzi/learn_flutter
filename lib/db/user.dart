import 'package:sqflite/sqlite_api.dart';
import 'package:learn_ff/db/db_operator.dart';

class User{

  User();
  User.of(String name, int age){
    this._name = name;
    this._age = age;
  }
  User.fromMapObject(Map<String, dynamic> map){
    this._id = map['id'];
    this._name = map['name'];
    this._age = map['age'];
  }

  int _id;
  String _name;
  int _age;

  int get id => _id;
  String get name => _name;
  int get age => _age;

  set id(int value){
    _id = value;
  }

  set name(String value){
    _name = name;
  }

  set age(int value){
    _age = value;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map['id'] =  _id;
    map['name'] = _name;
    map['age'] = _age;
    return map;
  }

  String toString(){
    return "User[id:$_id, name:$_name, age:$_age]";
  }

}

class UserDbProvider extends BaseDbProvider{

  UserDbProvider();

  String tableName = 'User';

  final String columnId = "id";
  final String columnName = "name";
  final String columnAge = "age";

  @override
  createTableString() {

    return '''
      create table $tableName($columnId integer primary key, 
      $columnName varchar(256) not null, 
      $columnAge integer default 10)
    ''';
  }

  @override
  getTableName() {
    return tableName;
  }

  Future<User> queryUserById(int id) async{
    Database db = await getDataBase();
    var list =  await db.rawQuery("select * from $tableName where $columnId = $id");
    if(list.length > 0){
      Map<String, dynamic> map = list[0];
      var user = User.fromMapObject(map);
      return user;
    }
    return null;
  }

  Future<List<User>> queryAllUser() async{
    Database db = await getDataBase();
    List<User> lists = new List();
    var list = await db.query(tableName, orderBy: ' $columnId desc');
    if(null != list && list.length > 0){
      for (var item in list) {
        var user = User.fromMapObject(item);
        lists.add(user);
      }
    }
    return lists;
  }

  Future<int> addUser(User user) async{
    Database db = await getDataBase();
    var result = await db.rawInsert("insert into $tableName($columnName, $columnAge)values(?,?)", [user.name, user.age]);
    return result;
  }

  Future<int> updateUser(User user) async{
    Database db = await getDataBase();
    var result = await db.rawUpdate("update $tableName set $columnName =? , $columnAge = ? where $columnId = ?", [user.name, user.age, user.id]);
    return result;
  }

  Future<int> deleteUser(int id) async{
    Database db = await getDataBase();
    var result = await db.rawDelete("delete from $tableName where $columnId = ?", [id]);
    return result;
  }

}
