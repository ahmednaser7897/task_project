// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:task_project/app/failure.dart';

class MyPosition {
  static void registerPlatformInstance() {
    if (Platform.isAndroid) {
      //GeolocatorAndroid.registerWith();
    } else if (Platform.isIOS) {
      //GeolocatorApple.registerWith();
    }
  }

  Future<Either<ServerExtension, Position>> determinePosition() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        //return Future.error('Location services are disabled.');
        return Left(ServerExtension('Location services are disabled.', 1));
      }

      permission = await Geolocator.checkPermission();
      print('permission is ' + permission.toString());
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          //return Future.error('Location permissions are denied');
          return Left(ServerExtension('Location permissions are denied.', 2));
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Left(ServerExtension(
            'Location permissions are permanently denied, we cannot request permissions.',
            3));
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      Position position = await Geolocator.getCurrentPosition();
      return Right(position);
    } catch (e) {
      print("erorr from getPrayersTime is " + e.toString());
      return Left(ServerExtension('Location permissions Erorr', 4));
    }
  }
}
