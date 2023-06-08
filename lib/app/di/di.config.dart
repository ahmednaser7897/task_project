// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../../cubit/app_cubit.dart' as _i8;
import '../../data/repository/auth_repository.dart' as _i10;
import '../../data/storage/local/app_prefs.dart' as _i6;
import '../../data/storage/remote/auth_api_service.dart' as _i9;
import '../../ui/home/get_markers_cubit/get_markers_cubit.dart' as _i11;
import '../../ui/login/cubit/logein_cubit.dart' as _i12;
import 'module/di_module.dart' as _i13;
import 'module/dio_module.dart' as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final dIModule = _$DIModule();
  final dioModule = _$DioModule();
  gh.factory<_i3.InternetConnectionChecker>(() => dIModule.connectionChecker);
  gh.factory<_i4.Key>(() => dIModule.getKey());
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => dIModule.prefs,
    preResolve: true,
  );
  gh.factory<_i6.AppPreferences>(
      () => _i6.AppPreferences(get<_i5.SharedPreferences>()));
  await gh.factoryAsync<_i7.Dio>(
    () => dioModule.getDio(get<_i6.AppPreferences>()),
    preResolve: true,
  );
  gh.factory<_i8.AppCubit>(() => _i8.AppCubit(get<_i6.AppPreferences>()));
  gh.factory<_i9.AuthServiceClient>(
      () => dIModule.getAuthService(get<_i7.Dio>()));
  gh.factory<_i10.AuthRepository>(() => _i10.AuthRepository(
        get<_i9.AuthServiceClient>(),
        get<_i6.AppPreferences>(),
      ));
  gh.factory<_i11.GetMarkersCubit>(
      () => _i11.GetMarkersCubit(get<_i10.AuthRepository>()));
  gh.factory<_i12.LogeinCubit>(
      () => _i12.LogeinCubit(get<_i10.AuthRepository>()));
  return get;
}

class _$DIModule extends _i13.DIModule {}

class _$DioModule extends _i14.DioModule {}
