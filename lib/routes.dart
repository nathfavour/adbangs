import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/pair_screen.dart';
import 'features/qr_scan/qr_scan_view.dart';
import 'core/connectivity/connection_manager.dart'; // Import ConnectionManager

class AppRoutes {
  static const String home = '/';
  static const String pair = '/pair';
  static const String qrScan = '/qrScan'; // New route

  final ConnectionManager connectionManager; // Add connectionManager

  AppRoutes(this.connectionManager); // Constructor

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(connectionManager: connectionManager));
      case pair:
        return MaterialPageRoute(
            builder: (_) => PairScreen(connectionManager: connectionManager));
      case qrScan:
        return MaterialPageRoute(
            builder: (_) => QRScanView(connectionManager: connectionManager));
      default:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(connectionManager: connectionManager));
    }
  }
}
