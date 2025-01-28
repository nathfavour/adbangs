import 'package:flutter/material.dart';
import 'app.dart';
import 'core/connectivity/connection_manager.dart';
import 'services/adb_service.dart'; // Import ADBService
import 'services/connection_service.dart'; // Import ConnectionService
import 'core/utils/logger.dart'; // Import Logger

void main() {
  final adbService = ADBService(); // Instantiate ADBService
  final logger = Logger(); // Instantiate Logger
  final connectionService =
      ConnectionService(adbService, logger); // Pass adbService and logger
  final connectionManager = ConnectionManager(adbService,
      connectionService); // Initialize ConnectionManager with services
  runApp(MyApp(connectionManager: connectionManager));
}
