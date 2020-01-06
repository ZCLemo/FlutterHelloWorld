import 'package:json_annotation/json_annotation.dart';
import 'Property.dart';

part "Data.g.dart";

@JsonSerializable()
class Data{
  final String by;
  final int descendants;
  final int id;
  final List<int> kids;
  final int score;
  final int time;
  final String title;
  final String type;
  final String url;
  final Property property;

  Data({this.by, this.descendants, this.id, this.kids, this.score, this.time,
    this.title, this.type, this.url,this.property});

  //反序列化
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$DataToJson(this);

}