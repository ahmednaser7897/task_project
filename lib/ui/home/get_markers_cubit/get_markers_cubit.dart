import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app/failure.dart';
import '../../../data/model/markers_response.dart';
import '../../../data/repository/auth_repository.dart';

part 'get_markers_state.dart';

@injectable
class GetMarkersCubit extends Cubit<GetMarkersState> {
  final AuthRepository _repository;
  GetMarkersCubit(this._repository) : super(GetMarkersInitial());
  static GetMarkersCubit get(BuildContext context) =>
      context.read<GetMarkersCubit>();
  Markers? response;

  void getMarkers() async {
    emit(LoadinGetMarkers());
    _repository.getMarkers().then((value) => value.fold(
          (failure) {
            emit(ErorrGetMarkers(failure));
          },
          (data) {
            response = data;
            emit(ScGetMarkers());
          },
        ));
  }
}
