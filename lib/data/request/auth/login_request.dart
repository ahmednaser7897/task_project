import 'package:json_annotation/json_annotation.dart';
part 'login_request.g.dart';

@JsonSerializable()
class LoginRequestData {
  @JsonKey(name: "UserPhone")
  String? userPhone;
  @JsonKey(name: "Password")
  String? password;
  @JsonKey(name: "UserFirebaseToken")
  String? userFirebaseToken;

  LoginRequestData({this.userPhone, this.password, this.userFirebaseToken});

  factory LoginRequestData.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestDataToJson(this);
}
