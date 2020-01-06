import 'package:json_annotation/json_annotation.dart';

part "Property.g.dart";

@JsonSerializable()
class Property {
  double width;
  double breadth;

  Property({
    this.width,
    this.breadth
  });

  //反序列化
  factory Property.fromJson(Map<String, dynamic> json) => _$PropertyFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$PropertyToJson(this);

}