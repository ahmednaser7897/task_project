import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task_project/app/di/module/dio_module.dart';

import '../../app/di/di.dart';
import '../../app/failure.dart';

import '../model/auth/login_response.dart';
import '../model/markers_response.dart';
import '../request/auth/login_request.dart';
import '../storage/local/app_prefs.dart';
import '../storage/remote/auth_api_service.dart';

@injectable
class AuthRepository {
  final AuthServiceClient _appServiceClient;

  final AppPreferences appPreferences;

  AuthRepository(
    this._appServiceClient,
    this.appPreferences,
  );

  Future<Either<ServerExtension, LoginResponse>> login(
      LoginRequestData loginRequest) async {
    try {
      String response = await _appServiceClient.login(
        pass: loginRequest.password ?? '',
        userFirebaseToken: loginRequest.userFirebaseToken ?? '',
        userPhone: loginRequest.userPhone ?? '',
      );
      var singleline = response.replaceAll("\n", "");
      LoginResponse loginResponse =
          LoginResponse.fromJson(jsonDecode(singleline));
      if (loginResponse.statusCode == 200) {
        saveAsAuthenticatedUser(loginResponse);
        return Right(loginResponse);
      } else {
        return Left(ServerExtension(
            loginResponse.message ?? '', loginResponse.statusCode ?? 0));
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return Left(ServerExtension("Wrong Password Or Phone", 400));
      } else {
        return Left(ServerExtension("Something went wrong, try again", 0));
      }
    } catch (e) {
      return Left(ServerExtension("Something went wrong, try again", 0));
    }
  }

  void saveAsAuthenticatedUser(LoginResponse data) {
    appPreferences.userToken = data.data!.userToken.toString();
    appPreferences.userData = data.data;
    getIt<Dio>().updateHeader(appPreferences);
  }

  Future<Either<ServerExtension, Markers>> getMarkers() async {
    try {
      String response = await _appServiceClient.getMarkers();
      var singleline = response.replaceAll("\n", "");
      Markers markers = Markers.fromJson(jsonDecode(singleline));
      if (markers.statusCode == 200) {
        return Right(markers);
      } else {
        return Left(
            ServerExtension(markers.message ?? '', markers.statusCode ?? 0));
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return Left(ServerExtension("Wrong Password Or Phone", 400));
      } else {
        return Left(ServerExtension("Something went wrong, try again", 0));
      }
    } catch (e) {
      return Left(ServerExtension("Something went wrong, try again", 0));
    }
  }
}
