// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'markers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Markers _$MarkersFromJson(Map<String, dynamic> json) => Markers(
      statusCode: json['status_code'] as int?,
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$MarkersToJson(Markers instance) => <String, dynamic>{
      'status_code': instance.statusCode,
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      taskID: json['TaskID'] as String?,
      lat: json['Lat'] as String?,
      longt: json['Longt'] as String?,
      name: json['Name'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'TaskID': instance.taskID,
      'Lat': instance.lat,
      'Longt': instance.longt,
      'Name': instance.name,
    };
