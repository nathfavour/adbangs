import 'package:flutter/material.dart';
import 'app.dart';
import 'core/connectivity/connection_manager.dart';
import 'services/adb_service.dart'; // Import ADBService
import 'services/connection_service.dart'; // Import ConnectionService

void main() {
  final adbService = ADBService(); // Instantiate ADBService
  final connectionService = ConnectionService(adbService,
      logger); // Instantiate ConnectionService with required arguments
  final connectionManager = ConnectionManager(adbService,
      connectionService); // Initialize ConnectionManager with services
  runApp(MyApp(connectionManager: connectionManager));
}
