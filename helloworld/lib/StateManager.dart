import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*子类自己管理*/
//class TapboxA extends StatefulWidget{
//  TapboxA({Key key}) : super(key:key);
//
//  @override
//  TapboxAState createState() => new TapboxAState();
//}
//
//class TapboxAState extends State<TapboxA>{
//
//  bool _active = false;
//
//  void handleTap(){
//
//    setState(() {
//      _active = !_active;
//    });
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("状态管理"),
//      ),
//      body: Center(
//        child: new GestureDetector(
//          onTap: handleTap,
//          child: new Container(
//            child: new Center(
//              child: new Text(
//                _active ? 'Active' : 'Inactive',
//                style: new TextStyle(
//                  fontSize: 32.0,
//                  color: Colors.white,
//                ),
//              ),
//            ),
//            width: 200.0,
//            height: 200.0,
//            decoration: new BoxDecoration(
//              color: _active ? Colors.lightGreen : Colors.grey,
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}


/*父类管理子类*/
//class TapboxA extends StatefulWidget{
//  @override
//  TapboxAState createState() => new TapboxAState();
//}
//
//class TapboxAState extends State{
//
//  bool active = false;
//
//  void handleTapboxChanged(bool newValue){
//    setState(() {
//      active = !active;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    return new Scaffold(
//      appBar: AppBar(
//        title: Text("状态管理"),
//      ),
//      body: Container(
//        child: new TapboxB(
//          onChanged: handleTapboxChanged,
//          active: active,
//        ),
//      )
//    );
//  }
//}
//
//class TapboxB extends StatelessWidget{
//
//  final bool active;
//  final ValueChanged<bool> onChanged;
//
//  TapboxB({Key key,this.active:false,@required this.onChanged}) : super(key : key);
//
//  void _handleTap() {
//    onChanged(!active);
//  }
//
//  Widget build(BuildContext context) {
//    return new GestureDetector(
//      onTap: _handleTap,
//      child: new Container(
//        child: new Center(
//          child: new Text(
//            active ? 'Active' : 'Inactive',
//            style: new TextStyle(fontSize: 32.0, color: Colors.white),
//          ),
//        ),
//        width: 200.0,
//        height: 200.0,
//        decoration: new BoxDecoration(
//          color: active ? Colors.lightGreen[700] : Colors.grey[600],
//        ),
//      ),
//    );
//  }
//
//}

/*混合状态管理*/
class TapboxA extends StatefulWidget{
  @override
  TapboxAState createState() => new TapboxAState();
}

class TapboxAState extends State{

  bool active = false;

  void handleTapboxChanged(bool newValue){
    setState(() {
      active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("状态管理"),
      ),
      body: Container(
        child: new TapboxB(
          onChanged: handleTapboxChanged,
          active: active,
        ),
      )
    );
  }
}

class TapboxB extends StatefulWidget{

  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxB({Key key,this.active : false,@required this.onChanged,}) : super(key : key);

  TapboxBState createState() =>  new TapboxBState();
}

class TapboxBState extends State<TapboxB>{

  bool highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,

      child: new Container(
        child: new Center(
          child: new Text(
            widget.active ? 'Active' : 'Inactice',
            style: new TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen : Colors.grey,
          border: highlight ?
              new Border.all(
                color : Colors.teal,
                width: 10.0,
              ) : null,
        ),
      ),
    );
  }
}