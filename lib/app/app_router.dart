import 'package:flutter/material.dart';

import '../ui/home/home_screen.dart';
import '../ui/login/login_screen.dart';

class AppRouter {
  static const String homeScreen = "homeScreen";
  static const String loginScreen = "loginScreen";
  static const String otpScreen = "otpScreen";

  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      /*
      case otpScreen:
        final request = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => OtpScreen(request: request));
      */
      default:
        return MaterialPageRoute(
            builder: (_) => const Center(
                  child: Text("Page Not Found"),
                ));
    }
  }
}
