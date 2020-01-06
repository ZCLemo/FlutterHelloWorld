//滚动视频

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollPage extends StatefulWidget {
  @override
  ScrollPageState createState() => new ScrollPageState();
}


class ScrollPageState extends State<ScrollPage>{

  String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  static const loadingTag = "##Loading##";
  var _words = <String>[loadingTag];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动视图"),
      ),
      body: Scrollbar(//显示进度条
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: str.split("")
                  .map((c) => Text(c, textScaleFactor: 2.0,)).toList(),
            ),
          ),
        ),
      ),
    );
  }
   */

    /*
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动视图"),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemExtent: 50.0,
        itemBuilder: (BuildContext context,int index){
          return ListTile(title: Text("$index"));
        },
      ),
    );
     */

    /*
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动视图"),
      ),
      body: ListView.separated(
        itemCount: 100,
        itemBuilder: (BuildContext context,int index){
          return ListTile(title: Text("$index"));
        },
        //分割线
        separatorBuilder: (BuildContext context,int index){
          return index%2==0 ? Divider(color: Colors.blue,height: 0.5,) : Divider(color: Colors.lightGreen,height: 0.5,);
        },
      ),
    );
     */

    //无限滚动
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动视图"),
      ),
      body:Column(
        children: <Widget>[
          ListTile(title: Text("数字列表")),
          Expanded(
            child: ListView.separated(
              itemCount: _words.length,
              itemBuilder: (context,index){
                if(_words[index] == loadingTag){
                  if(_words.length - 1 < 100){
                    retrieveData();
                    return Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 24.0,
                        height: 24.0,
                        child: CircularProgressIndicator(strokeWidth: 2.0,),
                      ),
                    );
                  }else{
                    //已经加载了100条数据，不再获取数据
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "没有更多了",
                        style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: 20.0,
                        ),
                      ),
                    );
                  }
                }

                return ListTile(title: Text(_words[index]),);
              },
              separatorBuilder: (context,index){
                return Divider(color: Colors.grey,height: 0.5,);
              },
            ),
          ),
        ],
      ),
    );
  }

  void retrieveData(){
    Future.delayed(Duration(seconds: 2)).then(
        (e){
          _words.insertAll(
            _words.length-1,
            ["0","1","2","3","4","5","6","7","8","9"],
          );
          setState(() {

          });
        }
    );
  }

}