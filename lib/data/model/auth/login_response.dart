import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "status_code")
  int? statusCode;
  bool? success;
  Data? data;
  String? message;

  LoginResponse({this.statusCode, this.success, this.data, this.message});
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class Data {
  String? usersID;
  String? userName;
  String? userPhone;
  String? password;
  String? email;
  @JsonKey(name: "UserToken")
  String? userToken;
  String? userFirebaseToken;
  String? loginType;
  String? socialid;
  String? userPhoto;
  String? userStatus;
  String? lastUpdatedUsers;
  String? createdAtUser;
  String? userRate;
  String? userTimesOfRates;
  String? userTotalRates;
  String? tripNumber;
  String? hasTrip;
  String? login;
  String? userVersion;

  Data(
      {this.usersID,
      this.userName,
      this.userPhone,
      this.password,
      this.email,
      this.userToken,
      this.userFirebaseToken,
      this.loginType,
      this.socialid,
      this.userPhoto,
      this.userStatus,
      this.lastUpdatedUsers,
      this.createdAtUser,
      this.userRate,
      this.userTimesOfRates,
      this.userTotalRates,
      this.tripNumber,
      this.hasTrip,
      this.login,
      this.userVersion});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
