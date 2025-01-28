import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/pair_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String pair = '/pair';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case pair:
        return MaterialPageRoute(builder: (_) => PairScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
