import 'package:flutter/material.dart';
import 'package:learn_ff/view_code.dart';
import '../asset_utils.dart';
import 'dart:convert' as convert;

//有状态的组件
class ListViewDemo extends StatefulWidget{
  @override
  _ListViewState createState() {
    return new _ListViewState();
  }

}


class _ListViewState extends State<ListViewDemo>{

  //列表控制器, 用于记录或者监听列表产生的事件位置等信息
  ScrollController _scrollController = new ScrollController();
  //是否需要加载新的数据
  bool isloading = false;
  //列表显示的数据源
  List datas = new List();
  //测试数据数量有限
  //给列表中的标题加一个index区分每一条数据
  int index = 0;
  //测试数据有限
  //给列表中的标题加一个刷新次数以记录刷新是否成功
  int refresh = 0;
  //假设80条后为最后一页数据,这里简单处理,实际并非如此
  //最后一页不再显示转圈的加载更多的状态,而是显示没有数据了
  final int total = 80;
  final int pageSize = 16;

  @override
  void initState() {
    this._getMetaData();
    super.initState();
    //此处判定位置已经到了最下方
    //_scrollController.position.pixels: 当前滚动位置
    //_scrollController.position.maxScrollExtent: 最大可滚动长度
    //即当往下滑动到最下方时开始加载数据
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //如果记录数还是小于总数则继续下拉下一页数据
        //如果已经超过该值,则不再加载数据,并且最后一条数据显示没有数据了.
        if(index < total && (datas.length % pageSize) == 0){
          this._getMetaData();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

   /**
    * 获取后台数据,这里从文件中读取
    */
   _getMetaData() async {
    //当开始加载数据时,将isloading设为true 示意处理加载数据的状态
    setState(() {
      isloading = true;
    });

    //从文件中读取数据, 实际上应该为从api接口中获取,这里作为模拟,数据格式为:
    /**
     *{
     *  "ctime":"2019-07-08 05:58:28",
     *  "title":"女子独自一人深夜约见男网友 却被困民房五小时 结果被伤害四次",
     *  "description": "女子独自一人深夜约见男网友 却被困民房五小时 结果被伤害四次",
     *  "picUrl":"http://p6-tt.byteimg.com/list/tos-cn-i-0000/9aa800e29be911e9b2977cd30a55d46c",
     *  "url":"http://toutiao.com/group/6708637225535406606/",
     *  "source":"经视看天下"
     *}
     * 
     */
    AssetsUtils.loadAssetsString("doc/list_view_data.txt").then(
      (value){
         var json = convert.jsonDecode(value);
         for(int i=0; i<json.length; i++){
           if(refresh == 0){
              json[i]['title'] = json[i]['title']+'$index';
           }else{
              //增加刷新次数区分数据是否刷新成功
              json[i]['title'] = json[i]['title']+'$index,已刷新$refresh次';
           }
           index++;
           setState(() {
              datas.add(json[i]);
           });
           
         }
      }
    ).catchError(
      (error){
        print("error happened! $error");
      }
    );
  }

  //显示一个正在加载的转圈图标
  Widget _buildProcessIndicator(){
    //如果该页数据小于17条,或者超过80,则显示没有数据了
    if(index >= total || (datas.length % pageSize) != 0){
      return Center(
        child: Text('已经没有数据了!', style: TextStyle(color:Colors.red)),
      );
    }else{
      return new Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          //Opacity组件设置其子组件的透明度, 1为不透明, 0为完全透明.
          child: Opacity(
            opacity: isloading ? 1.0: 00,
            //圆形进度条组件,默认即好
            child: new CircularProgressIndicator(),
          )
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("列表组件示例"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.rate_review),
            tooltip: '查看代码实现',
            onPressed: ()=> {
              AssetsUtils.loadAssetsString("doc/listview_demo.txt").then(
                (value){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return new ViewCode(title: '列表组件代码实现', content: value);
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
      //RefreshIndicator组件为flutter的下拉刷新组件,
      body: RefreshIndicator(
        displacement: 20.0, //下拉距离 达到20像素则调用onRefresh方法,默认40.0
        //一旦其子组件下拉到一定距离,则会触发其onRefresh方法,并且显示重新加载的图标
        onRefresh: _onRefresh, 
        child: ListView.separated(
          //列表控制器: 列表的状态都会记录在_scrollController中,也因此
          //_scrollController.addListener 才能生效
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          //生成列表中的具体内容
          itemBuilder: _listBuild, 
          //分隔条
          separatorBuilder: (context, index){
            return new Divider(color: Colors.blueGrey);
          }, 
          //记录总数, 比源数据多1条,多出一这条空间用于显示加载更新的圆形进度条,或者用于显示"没有更多数据"的提示
          itemCount: datas.length + 1,
         ),
      )
    );
  }


  Widget _listBuild(BuildContext context, int index){
    Size size = MediaQuery.of(context).size;
    //如果是最后一行则显示圆形进度条或者没有更多数据了.
    if(datas.length == index){
      return _buildProcessIndicator();
    }else{
      //显示真正的内容,标题,图片,及日期等内容
      return Container(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: size.width/2-10,
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.all(0.0),
                    onPressed: ()=>{
                      print(datas[index]['title'])
                    }, 
                    child: Text(datas[index]['title'])
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(datas[index]['source'], style: TextStyle(fontSize: 10)),
                      Text(datas[index]['ctime'], style: TextStyle(fontSize: 10)),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: size.width/2-10,
              child:Image.network(
                datas[index]['picUrl'],
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      );
    }
  }

  //原数据清空,重新加载数据等操作,必须是异步 Future
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1)).then((e){
      setState(() {
        refresh ++;
        datas.clear();
        index = 0;
        this._getMetaData();
      });
    });
  }

}




