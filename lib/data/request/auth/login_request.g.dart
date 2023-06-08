// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestData _$LoginRequestDataFromJson(Map<String, dynamic> json) =>
    LoginRequestData(
      userPhone: json['UserPhone'] as String?,
      password: json['Password'] as String?,
      userFirebaseToken: json['UserFirebaseToken'] as String?,
    );

Map<String, dynamic> _$LoginRequestDataToJson(LoginRequestData instance) =>
    <String, dynamic>{
      'UserPhone': instance.userPhone,
      'Password': instance.password,
      'UserFirebaseToken': instance.userFirebaseToken,
    };
