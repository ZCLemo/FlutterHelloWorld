import 'package:flutter/material.dart';
import 'StateLifeCycle.dart';
import 'StateManager.dart';
import 'BasicModule.dart';
import 'PageLayout.dart';
import 'ScrollList.dart';
import 'GridViewPage.dart';
import 'CustomScrollViewPage.dart';
import 'ScrollListenerPage.dart';
import 'FunctionalWidgetPage.dart';
import 'EventHandlePage.dart';
import 'AnimationPage.dart';
import 'CustomerMoudlePage.dart';
import 'HttpRequestPage.dart';
import 'JsonSerializePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'hello world'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),

                FlatButton(
                  child: Text("open new route"),
                  textColor: Colors.red,
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)
                        {
                          return TestRoute();
                        })
                    );
                  },
                ),

                RaisedButton(
                  child: Text("打开提示页哦"),
                  textColor: Colors.blue,
                  onPressed: () async{
                    var result = await Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context){
                            return TipRoute(
                              text: "我是提示xxxx",
                            );
                          },
                        )
                    );
                    print("路由返回值：$result");
                  },
                ),

                RaisedButton(
                  child: Text("State的生命周期"),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return CounterWidget();
                        })
                    );
                  },
                ),

                RaisedButton(
                  child: Text("状态管理"),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return TapboxA();
                        })
                    );
                  },
                ),

                RaisedButton(
                  child: Text("基础组件"),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return BasicModule();
                        })
                    );
                  },
                ),

                RaisedButton(
                  child: Text("页面布局"),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return PageLayout();
                        })
                    );
                  },
                ),

                RaisedButton(
                  child: Text("滚动视图"),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return ScrollPage();
                        })
                    );
                  },
                ),

                RaisedButton(
                  child: Text("GridView"),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return GridViewPage();
                        })
                    );
                  },
                ),

                RaisedButton(
                  child: Text("CustomScrollViewPage"),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return CustomScrollViewPage();
                        })
                    );
                  },
                ),

                RaisedButton(
                  child: Text("滚动监听"),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return ScrollListenerPage();
                        })
                    );
                  },
                ),

                RaisedButton(
                  child: Text("功能性组件"),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return FunctionalWidgetPage();
                        })
                    );
                  },
                ),

                RaisedButton(
                  child: Text("事件处理与通知"),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return EventHandlePage();
                        })
                    );
                  },
                ),

                RaisedButton(
                  child: Text("动画"),
                  onPressed: (){
                    Navigator.push(context,
//                        MaterialPageRoute(builder: (context){
//                          return AnimationPage();
//                        }),
                        //自定义页面切换过渡动画
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 500),
                          pageBuilder: (BuildContext context,Animation animation,Animation secondaryAnimation){
                            return new FadeTransition(
                              opacity: animation,
                              child: AnimationPage(),
                            );
                          }
                        ),
                    );
                  },
                ),


                RaisedButton(
                  child: Text("自定义组件"),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return CustomerMoudlePage();
                        })
                    );
                  },
                ),

                RaisedButton(
                  child: Text("网络请求"),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return HttpRequestPage();
                        })
                    );
                  },
                ),

                RaisedButton(
                  child: Text("Json序列化"),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return JsonSerializePage();
                        })
                    );
                  },
                ),

              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
      
    );
  }

}

class TestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new router"),
      ),
    );
  }
}

class TipRoute extends StatelessWidget{

  TipRoute({
    Key key,
    @required this.text,
  }) : super(key:key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed:() => Navigator.pop(context,"我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }

}
