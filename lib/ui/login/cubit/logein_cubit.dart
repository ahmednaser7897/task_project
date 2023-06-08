import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/failure.dart';
import '../../../../data/model/auth/login_response.dart';
import '../../../../data/repository/auth_repository.dart';
import '../../../../data/request/auth/login_request.dart';

part 'logein_state.dart';

@injectable
class LogeinCubit extends Cubit<LogeinState> {
  final AuthRepository _repository;

  LogeinCubit(this._repository) : super(AppInitial());

  static LogeinCubit get(BuildContext context) => context.read<LogeinCubit>();
  LoginResponse? loginResponse;

  void login({
    required LoginRequestData loginRequestData,
  }) async {
    emit(LoadinLogeIn());
    _repository.login(loginRequestData).then((value) => value.fold(
          (failure) {
            print('failure');
            print(failure.erorrMessege);
            emit(ErorrLogeIn(failure));
          },
          (data) {
            loginResponse = data;
            emit(ScLogeIn());
          },
        ));
  }
}
