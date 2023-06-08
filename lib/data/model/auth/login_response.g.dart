// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      statusCode: json['status_code'] as int?,
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      usersID: json['usersID'] as String?,
      userName: json['userName'] as String?,
      userPhone: json['userPhone'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      userToken: json['UserToken'] as String?,
      userFirebaseToken: json['userFirebaseToken'] as String?,
      loginType: json['loginType'] as String?,
      socialid: json['socialid'] as String?,
      userPhoto: json['userPhoto'] as String?,
      userStatus: json['userStatus'] as String?,
      lastUpdatedUsers: json['lastUpdatedUsers'] as String?,
      createdAtUser: json['createdAtUser'] as String?,
      userRate: json['userRate'] as String?,
      userTimesOfRates: json['userTimesOfRates'] as String?,
      userTotalRates: json['userTotalRates'] as String?,
      tripNumber: json['tripNumber'] as String?,
      hasTrip: json['hasTrip'] as String?,
      login: json['login'] as String?,
      userVersion: json['userVersion'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'usersID': instance.usersID,
      'userName': instance.userName,
      'userPhone': instance.userPhone,
      'password': instance.password,
      'email': instance.email,
      'UserToken': instance.userToken,
      'userFirebaseToken': instance.userFirebaseToken,
      'loginType': instance.loginType,
      'socialid': instance.socialid,
      'userPhoto': instance.userPhoto,
      'userStatus': instance.userStatus,
      'lastUpdatedUsers': instance.lastUpdatedUsers,
      'createdAtUser': instance.createdAtUser,
      'userRate': instance.userRate,
      'userTimesOfRates': instance.userTimesOfRates,
      'userTotalRates': instance.userTotalRates,
      'tripNumber': instance.tripNumber,
      'hasTrip': instance.hasTrip,
      'login': instance.login,
      'userVersion': instance.userVersion,
    };
