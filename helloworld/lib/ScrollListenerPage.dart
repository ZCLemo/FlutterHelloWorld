import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollListenerPage extends StatefulWidget{
  @override
  ScrollListenerPageState createState() => new ScrollListenerPageState();
}

class ScrollListenerPageState extends State<ScrollListenerPage>{

  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    // TODO: implement initState

    _controller.addListener((){
      print(_controller.offset);
      if(_controller.offset < 1000 && showToTopBtn){
        setState(() {
          showToTopBtn = false;
        });
      }else if(_controller.offset >= 1000 && showToTopBtn==false){
        setState(() {
          showToTopBtn = true;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动监听"),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 100,
          itemExtent: 50.0,
          controller: _controller,
          itemBuilder: (context, index){
            return ListTile(title: Text("$index"),);
          },
        ),
      ),
      floatingActionButton: !showToTopBtn ? null : FlatButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
          _controller.animateTo(0, duration: Duration(milliseconds: 200), curve: Curves.ease);
        },
      ),
    );
  }

}