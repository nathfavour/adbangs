import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/pair_screen.dart';
import 'features/qr_scan/qr_scan_view.dart';
import 'features/pairing/pairing_view.dart';

class AppRoutes {
  static const String home = '/';
  static const String pair = '/pair';
  static const String qrScan = '/qrScan'; // New route

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case pair:
        return MaterialPageRoute(builder: (_) => PairScreen());
      case qrScan:
        return MaterialPageRoute(builder: (_) => QRScanView()); // New route
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
