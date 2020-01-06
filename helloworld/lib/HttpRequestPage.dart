import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HttpRequestPage extends StatefulWidget{
  @override
  HttpRequestPageState createState() {
    return HttpRequestPageState();
  }

}

class HttpRequestPageState extends State<HttpRequestPage>{

  bool _loading = false;
  String _text = "";
  Dio _dio = new Dio();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("网络请求"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
          future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              Response response = snapshot.data;
              if(snapshot.hasError){
                return Text(snapshot.error.toString());
              }

              //请求成功，通过项目信息构建用于显示项目名称的ListView
              return ListView(
                children: response.data.map<Widget>((e) =>
                    ListTile(title: Text(e["full_name"]))
                ).toList(),
              );
            }
            //请求未完成时弹出loading
            return CircularProgressIndicator();
          },
        ),
      ),


//      body: ConstrainedBox(
//        constraints: BoxConstraints.expand(),
//        child: SingleChildScrollView(
//          child: Column(
//            children: <Widget>[
//
//              RaisedButton(
//                child: Text("获取百度首页"),
//                onPressed: _loading ? null : () async{
//                  setState(() {
//                    _loading = true;
//                    _text = "正在请求...";
//                  });
//
//                  try{
//                    HttpClient httpClient = new HttpClient();
//                    HttpClientRequest request = await httpClient.getUrl(
//                      Uri.parse("https://www.baidu.com")
//                    );
//                    request.headers.add("user-agent", "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
//                    //等待连接服务器（会将请求信息发送给服务器）
//                    HttpClientResponse response = await request.close();
//                    //读取响应内容
//                    _text = await response.transform(utf8.decoder).join();
//                    //输出响应头
//                    print(response.headers);
//
//                    //关闭client后，通过该client发起的所有请求都会中止。
//                    httpClient.close();
//
//                  }catch(e){
//                    _text = "请求失败：$e";
//                  }finally{
//                    setState(() {
//                      _loading = false;
//                    });
//                  }
//
//                },
//              ),
//
//              Text(_text),
//
//            ],
//          ),
//        ),
//      ),
    );
  }

}