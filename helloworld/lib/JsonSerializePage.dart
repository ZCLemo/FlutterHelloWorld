import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Data.dart';

class JsonSerializePage extends StatefulWidget{
  @override
  JsonSerializePageState createState() {
    return JsonSerializePageState();
  }
}

class JsonSerializePageState extends State<JsonSerializePage>{

  Data _data;

  Map<String, dynamic> _json;

  @override
  void initState() {

    Map<String ,dynamic> map = json.decode(JsonString.mockdata);

    _data = Data.fromJson(map);

    _json = _data.toJson();

    print(_json);

    print(_data.property.width.toString());

    print(_data.property.breadth.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("json序列化"),
      ),
      body: Center(
        child: Text(_data.url),
      ),
    );
  }
}

abstract class JsonString{
  static final String mockdata = ''' {
  "by" : "dhouston",
  "descendants" : 71,
  "id" : 8863,
  "kids" : [ 8952, 9224, 8917, 8884, 8887, 8943, 8869, 8958, 9005, 9671, 8940, 9067, 8908, 9055, 8865, 8881, 8872, 8873, 8955, 10403, 8903, 8928, 9125, 8998, 8901, 8902, 8907, 8894, 8878, 8870, 8980, 8934, 8876 ],
  "score" : 111,
  "time" : 1175714200,
  "title" : "My YC app: Dropbox - Throw away your USB drive",
  "type" : "story",
  "url" : "http://www.getdropbox.com/u/2/screencast.html",
  "property" : {
    "width" : 5.0,
    "breadth" : 10.0
  }
}''';
}


