
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationHelper {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> determinePosition() async {
    await Geolocator.requestPermission();
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<String?> getLocationName(LatLng position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      String name1 = placemarks[0].name ?? '';
      String name2 = placemarks[0].administrativeArea ?? '';
      String name3 = placemarks[0].locality ?? '';
      String name4 = placemarks[0].subAdministrativeArea ?? '';
      String? name = '$name1 $name3 $name4 $name2';
      return name;
    } catch (e) {
      print("e is $e");
      return null;
    }
  }
}
