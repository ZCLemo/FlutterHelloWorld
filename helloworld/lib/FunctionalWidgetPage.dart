//功能性widget

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*

//WillPopScope返回按钮拦截

class FunctionalWidgetPage extends StatefulWidget{
  @override
  FunctionalWidgetPageState createState() {
    return FunctionalWidgetPageState();
  }

}

class FunctionalWidgetPageState extends State<FunctionalWidgetPage>{

  DateTime _lastPressedAt;//上次点击时间

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("功能性Widget"),
      ),
      body: WillPopScope(
        child: Container(
          alignment: Alignment.center,
          child: Text("1s内连续点击2次返回退出"),
        ),
        onWillPop: () async{
          if(_lastPressedAt==null ||
              DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)){
            _lastPressedAt = DateTime.now();
            return false;
          }else{
            return true;
          }
        },
      ),
    );
  }
}
 */


//数据共享（InheritedWidget）
/*
class ShareDataWidget extends InheritedWidget{

  ShareDataWidget({
    @required this.data,
    Widget child
  }) : super(child: child);

  final int data; //需要在子树中共享的数据，保存点击次数

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context){
    //此方法不会调用子类的didChangeDependencies()
    return context.ancestorInheritedElementForWidgetOfExactType(ShareDataWidget).widget;
    //会调用子类的didChangeDependencies()
    //return context.inheritFromWidgetOfExactType(ShareDataWidget);
  
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return oldWidget.data != data;
  }
}

class TestWidget extends StatefulWidget{
  @override
  TestWidgetState createState() {
    return TestWidgetState();
  }

}

class TestWidgetState extends State<TestWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }

}

class FunctionalWidgetPage extends StatefulWidget {
  @override
  FunctionalWidgetPageState createState() => new FunctionalWidgetPageState();
}

class FunctionalWidgetPageState extends State<FunctionalWidgetPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("功能性组件"),
      ),
      body: Center(
        child: ShareDataWidget( //使用ShareDataWidget
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TestWidget(),//子widget中依赖ShareDataWidget
              ),
              RaisedButton(
                child: Text("Increment"),
                //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
                onPressed: () => setState(() => ++count),
              )
            ],
          ),
        ),
      ),
    );
  }
}

 */


//颜色和主题
/*
class FunctionalWidgetPage extends StatefulWidget{
  @override
  FunctionalWidgetPageState createState() {
    return FunctionalWidgetPageState();
  }

}

class FunctionalWidgetPageState extends State<FunctionalWidgetPage>{

  Color themeColor = Colors.teal;//当前主题颜色

  @override
  Widget build(BuildContext context) {

    ThemeData themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("颜色和主题"),
      ),
      body: Column(
          children: <Widget>[
            //背景为蓝色，则title自动为白色
            NavBar(color: Colors.blue, title: "标题"),
            //背景为白色，则title自动为黑色
            NavBar(color: Colors.white, title: "标题"),

            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(
                    color: Colors.black
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text("颜色不跟随主题")
                  ]
              ),
            ),


            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(
                    color: themeColor,
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text("颜色不跟随主题")
                  ]
              ),
            ),

          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            themeColor = (themeColor == Colors.teal ? Colors.blue : Colors.teal);
          });
        },
        child: Icon(Icons.palette),
      ),
    );
  }
}

class NavBar extends StatelessWidget{
  final String title;
  final Color color;//背景颜色

  NavBar({
    Key key, this.title, this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 3,
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}
 */


//异步更新UI
class FunctionalWidgetPage extends StatefulWidget{
  @override
  FunctionalWidgetPageState createState() {
    return FunctionalWidgetPageState();
  }

}

class FunctionalWidgetPageState extends State<FunctionalWidgetPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("功能性Widget"),
      ),
      body: Center(

        child: Column(

          children: <Widget>[

            FutureBuilder<String>(
              future: mockNetwrokData(),
              builder: (BuildContext context,AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  if(snapshot.hasError){
                    return Text("Error: ${snapshot.error}");
                  }else{
                    return Text("Contents: ${snapshot.data}");
                  }
                }else{
                  return CircularProgressIndicator(
                    backgroundColor: Colors.yellow,
                  );
                }
              },
            ),

            StreamBuilder<int>(
              stream: counter(),
              builder: (BuildContext context,AsyncSnapshot<int> snapshot){
                if (snapshot.hasError){
                  return Text('Error: ${snapshot.error}');
                }
                switch (snapshot.connectionState){

                  case ConnectionState.none:
                    return Text('没有Stream');

                  case ConnectionState.waiting:
                    return Text('等待数据...');

                  case ConnectionState.active:
                    return Text('active: ${snapshot.data}');

                  case ConnectionState.done:
                    return Text('Stream已关闭');
                }
                return null;
              },
            ),

          ],

        ),
      ),
    );
  }
}

//Future模式
Future<String> mockNetwrokData() async{
  return Future.delayed(Duration(seconds: 2), ()=> "我是网络请求数据");
}

//Stream模式
Stream<int> counter(){
  return Stream.periodic(Duration(seconds: 1),(i){
    return i;
  });
}

