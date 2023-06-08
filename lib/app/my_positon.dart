// ignore_for_file: avoid_print

import 'package:geolocator/geolocator.dart';
import 'package:task_project/app/location.dart';

class CurantPosition {
  Position? position;

  Future<Position?> getMyPosition() async {
    try {
      MyPosition p = MyPosition();
      var data = await p.determinePosition();
      data.fold((l) {
        throw Exception('erorr');
      }, (r) {
        //print(r.latitude);
        //print(r.longitude);
        position = r;
      });

      return position;
    } catch (e) {
      print("erorr from getMyPosition is " + e.toString());
      return null;
    }
  }
}
