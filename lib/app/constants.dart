import 'package:google_maps_flutter/google_maps_flutter.dart';

class Constants {
  static const String empty = "";
  static const int zero = 0;
  static const double zeroDouble = 0;
  static const int apiTimeOut = 90000;
  static const String defaultLanguage = "ar";
  static const String defaultCurrency = "د.ك";
  static const String arLanguage = "ar";
  static const String enLanguage = "en";
  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(29.2567487, 47.9768847),
    zoom: 12,
  );
}
