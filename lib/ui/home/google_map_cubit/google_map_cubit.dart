import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task_project/app/extensions.dart';
import '../../../app/constants.dart';
import '../../../app/location_helper.dart';
import '../../../data/model/markers_response.dart';

part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit() : super(GoogleMapInitial());
  static GoogleMapCubit get(BuildContext context) =>
      context.read<GoogleMapCubit>();

  GoogleMapController? mapController;
  List<Marker> markers = [];
  String userAddress = '';
  bool moving = false;
  LatLng? position = Constants.initialCameraPosition.target;
  late CameraPosition initialCameraPosition;

  Future<void> addMarker(LatLng latLng, {String? title}) async {
    emit(LoadinAddMarker());
    markers.add(Marker(
        markerId: MarkerId(latLng.toString()),
        position: latLng,
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          title: title,
        )));
    emit(SCAddMarker());
  }

  Future<void> addAllMarker(List<Data> newMarkers) async {
    emit(LoadinAddAllMarker());
    markers = [];
    for (var element in newMarkers) {
      LatLng latLng = LatLng(double.parse(element.lat.orEmpty()),
          double.parse(element.longt.orEmpty()));
      await addMarker(latLng, title: element.name);
      // print(element.name);
      // print(markers.length);
    }
    emit(SCAddALLMarker());
  }

  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "";

  Future<void> getPolyline(LatLng marker1, LatLng marker2, int id) async {
    emit(LoadinAddPolyLine());
    // PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    //   googleAPiKey,
    //   PointLatLng(marker1.latitude, marker1.longitude),
    //   PointLatLng(marker2.latitude, marker2.longitude),
    //   travelMode: TravelMode.driving,
    // );
    polylineCoordinates.add(LatLng(marker1.latitude, marker1.longitude));
    polylineCoordinates.add(LatLng(marker2.latitude, marker2.longitude));
    addPolyLine(id);
    emit(SCAddPolyLine());
  }

  void addPolyLine(int myid) {
    PolylineId id = PolylineId("$myid");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    // print('polylines');
    // print(polylines.length);
  }

  Future<void> addAllPolylines() async {
    polylines = {};
    emit(LoadinAddAllPolyLine());
    for (int i = 0; i < markers.length; i++) {
      await getPolyline(markers[i].position, markers[i].position, i);
      print("getPolyline");
      print(polylines.length);
    }
    await getPolyline(
        markers.last.position, markers.first.position, markers.length);
    emit(SCAddAllPolyLine());
  }

  void initialCamera(List<Data> newMarkers) {
    emit(LoadinInitialCamera());
    initialCameraPosition = newMarkers.isEmpty
        ? Constants.initialCameraPosition
        : CameraPosition(
            target: LatLng(double.parse(newMarkers[0].lat.orEmpty()),
                double.parse(newMarkers[0].longt.orEmpty())),
            zoom: 9,
          );

    emit(SCInitialCamera());
  }

  Future<void> mapInit(List<Data> newMarkers) async {
    emit(LoadinInitialMap());
    initialCamera(newMarkers);
    await addAllMarker(newMarkers);
    await addAllPolylines();
    emit(SCInitialMap());
  }

  void onMapMove(pos) {
    emit(LoadinOnMapMove());
    //setState(() {
    position = pos.target;
    print(position.toString());
    //});
    emit(SCOnMapMove());
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    emit(LoadinOnMapCreated());
    mapController = controller;
    emit(SCOnMapCreated());
  }

  Future<void> onMapStop() async {
    emit(LoadinOnMapStop());
    addMarker(position!);
    LocationHelper locationHelper = LocationHelper();
    //setState(() {
    moving = true;
    emit(LoadinOnMapMove());
    //});
    String? location = await locationHelper.getLocationName(position!);
    if (location != null) {
      userAddress = location;
      print(location);
      print(userAddress);
    }
    //setState(() {
    moving = false;
    //});
    emit(SCOnMapStop());
  }
}
