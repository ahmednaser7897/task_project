part of 'google_map_cubit.dart';

abstract class GoogleMapState extends Equatable {
  const GoogleMapState();

  @override
  List<Object> get props => [];
}

class GoogleMapInitial extends GoogleMapState {}

class LoadinAddMarker extends GoogleMapState {}

class SCAddMarker extends GoogleMapState {}

class LoadinAddAllMarker extends GoogleMapState {}

class SCAddALLMarker extends GoogleMapState {}

class LoadinAddPolyLine extends GoogleMapState {}

class SCAddPolyLine extends GoogleMapState {}

class LoadinAddAllPolyLine extends GoogleMapState {}

class SCAddAllPolyLine extends GoogleMapState {}

class LoadinInitialCamera extends GoogleMapState {}

class SCInitialCamera extends GoogleMapState {}

class LoadinInitialMap extends GoogleMapState {}

class SCInitialMap extends GoogleMapState {}

class LoadinOnMapMove extends GoogleMapState {}

class SCOnMapMove extends GoogleMapState {}

class LoadinOnMapCreated extends GoogleMapState {}

class SCOnMapCreated extends GoogleMapState {}

class LoadinOnMapStop extends GoogleMapState {}

class SCOnMapStop extends GoogleMapState {}

class SCOnMapMoving extends GoogleMapState {}
