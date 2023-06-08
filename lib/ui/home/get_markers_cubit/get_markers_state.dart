part of 'get_markers_cubit.dart';

abstract class GetMarkersState extends Equatable {
  const GetMarkersState();

  @override
  List<Object> get props => [];
}

class GetMarkersInitial extends GetMarkersState {}

class LoadinGetMarkers extends GetMarkersState {}

class ScGetMarkers extends GetMarkersState {}

class ErorrGetMarkers extends GetMarkersState {
  final ServerExtension failur;
  const ErorrGetMarkers(this.failur);
}
