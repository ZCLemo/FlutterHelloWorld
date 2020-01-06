import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'EventBus.dart';

class EventHandlePage extends StatefulWidget{
  @override
  EventHandlePageState createState() {
    return EventHandlePageState();
  }

}

class EventHandlePageState extends State<EventHandlePage>{

  String operateion = "NO Gesture detected";

  bool toggle = false;

  double _left = 0;
  double _top = 0;

  String _msg = "123";

  TapGestureRecognizer tapGestureRecognizer = new TapGestureRecognizer();

  @override
  Widget build(BuildContext context) {

    bus.on("login", (arg){
      print(arg);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("事件处理"),
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (noti){
          setState(() {
            _msg += noti.msg+" ";
          });

          return true;
        },

        child: Center(
          child: Column(

            children: <Widget>[

              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: 200,
                  height: 100,
                  child: Text(
                    operateion,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () => updateText("Tap"),
                onDoubleTap: () => updateText("Double Tap"),
                onLongPress: () => updateText("LongPress"),
              ),

              Text.rich(
                  TextSpan(
                    children: [

                      TextSpan(text: "你好Jack"),

                      TextSpan(
                        text: "点我变色",
                        style: TextStyle(
                          fontSize: 30,
                          color: toggle ? Colors.blue : Colors.red,
                        ),
                        recognizer: tapGestureRecognizer..onTap = (){
                          setState(() {
                            toggle = !toggle;
                          });
                        },
                      ),

                      TextSpan(text: "你好Tom"),

                    ],
                  )
              ),

              Builder(builder: (context)
              {
                return RaisedButton(
                  onPressed: (){
                    MyNotification("Hi").dispatch(context);
                  },
                  child: Text("Send Notification"),
                );
              }),

              Text(_msg),

              Expanded(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: _top,
                      left: _left,
                      child: GestureDetector(
                        child: CircleAvatar(child: Text("A")),
                        //手指按下时会触发此回调
                        onPanDown: (DragDownDetails e) {
                          //打印手指按下的位置(相对于屏幕)
                          print("用户手指按下：${e.globalPosition}");
                        },
                        //手指滑动时会触发此回调
                        onPanUpdate: (DragUpdateDetails e) {
                          //用户手指滑动时，更新偏移，重新构建
                          setState(() {
                            _left += e.delta.dx;
                            _top += e.delta.dy;
                          });
                        },
                        onPanEnd: (DragEndDetails e){
                          //打印滑动结束时在x、y轴上的速度
                          print(e.velocity);
                        },
                      ),
                    )
                  ],
                ),
              ),

            ],

          ),

        ),
      ),
      
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         bus.emit("login","登录");
        },
        child: Text("登录"),
      ),

    );
    
  }

  void updateText(String text){
    setState((){
      operateion = text;
    });
  }

}

class MyNotification extends Notification{
  MyNotification(this.msg);
  final String msg;
}

