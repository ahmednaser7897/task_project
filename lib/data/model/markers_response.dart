import 'package:json_annotation/json_annotation.dart';

part 'markers_response.g.dart';

@JsonSerializable()
class Markers {
  @JsonKey(name: "status_code")
  int? statusCode;
  bool? success;
  List<Data>? data;
  String? message;

  Markers({this.statusCode, this.success, this.data, this.message});
  factory Markers.fromJson(Map<String, dynamic> json) =>
      _$MarkersFromJson(json);

  Map<String, dynamic> toJson() => _$MarkersToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "TaskID")
  String? taskID;
  @JsonKey(name: "Lat")
  String? lat;
  @JsonKey(name: "Longt")
  String? longt;
  @JsonKey(name: "Name")
  String? name;

  Data({this.taskID, this.lat, this.longt, this.name});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
