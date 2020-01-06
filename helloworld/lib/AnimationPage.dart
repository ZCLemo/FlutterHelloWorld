import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget{
  @override
  AnimationPageState createState() {
    // TODO: implement createState
    return AnimationPageState();
  }

}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );


    animation = new Tween(begin: 0.0,end: 114.0).animate(controller)..addListener((){
      setState(() {

      });
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });

    //启动动画（正向执行）
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),

      body: Center(
        child: Image.asset(
          "images/Icon.png",
          width: animation.value,
          height: animation.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}