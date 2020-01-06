
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget{

  const CounterWidget({
    Key key,
    this.initValue: 6
  });

  final int initValue;

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget>{

  static GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  int _counter;

  @override
  void initState(){
    super.initState();
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {

    print("build");

    return Scaffold(

      key: _globalKey,
      
      appBar: AppBar(
        title: Text("StateLiftCycle"),
      ),

      body: Center(
        // ignore: missing_return
        child: Builder(builder: (context) {
          return Column(
            children: <Widget>[

              FlatButton(
                child: Text('$_counter'),
                color: Colors.greenAccent,
                onPressed: ()=> setState(
                      () => ++_counter,
                ),
              ),


              FlatButton(
                color: Colors.greenAccent,
                child: Text("显示SnackBar"),
                onPressed: (){
                  //查找父级最近的Scaffold对应的ScaffoldState对象
//                  ScaffoldState _state = context.ancestorStateOfType(
//                      TypeMatcher<ScaffoldState>()
//                  );
                  //使用GlobalKey开销较大，如果有其他可选方案，应尽量避免使用它
                  ScaffoldState _state = _globalKey.currentState;
                  //调用ScaffoldState的showSnackBar来弹出SnackBar
                  _state.showSnackBar(
                      SnackBar(
                        content: Text("我是SnackBar哈哈"),
                      )
                  );
                },
              )

            ],
          );
        }),
      ),

    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
  }


  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

}