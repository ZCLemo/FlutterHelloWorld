//基础组件

import 'package:flutter/material.dart';

class BasicModule extends StatefulWidget{

  @override
  BasicModuleState createState() => new BasicModuleState();

}

class BasicModuleState extends State<BasicModule>{

  String iconStrings = "";

  bool switchState = true;

  bool checkState = false;

  void switchStateChanged(value){
    setState(() {
      switchState = value;
    });
  }

  void checkBoxStateChanged(value){
    setState(() {
      checkState = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    iconStrings += "\uE914";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("基础组件"),
      ),
      body: Column(
        children: <Widget>[
          Text(
            "这是一段测试文本"*10,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textScaleFactor: 1.5,
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
          RaisedButton(
            child: Text("Raised"),
            onPressed: (){},
          ),
          Image(
            image: AssetImage("images/Icon.png"),
            height: 40.0,
            width: 30.0,
          ),
          Image.network(
            "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            width: 50,
          ),
          Icon(
            Icons.error_outline,
            color: Colors.blue,
          ),
          Text(iconStrings),
          Switch(
            value: switchState,
            onChanged: switchStateChanged,
            activeColor: Colors.red,
            inactiveThumbColor: Colors.blue,
          ),
          Checkbox(value: checkState, onChanged: checkBoxStateChanged),
          TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: "手机号",
              hintText: "请输入手机号",
              prefixIcon: Icon(Icons.mobile_screen_share),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
          ),

          SizedBox(
            height: 5.0,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.red),
              value: 0.5,
            ),
          ),

          CircularProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation(Colors.red),
            value: .5,
            strokeWidth: 3.0,
          ),

        ],

      ),
    );
  }


}