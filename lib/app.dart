import 'package:flutter/material.dart';
import 'routes.dart';
import 'core/adb/adb_service.dart';
import 'core/connectivity/connection_manager.dart';
import 'core/utils/logger.dart';
import 'features/auto_connect/auto_connect_controller.dart';
import 'theme/app_theme.dart';
import 'services/connection_service.dart';

void main() {
  final AppLogger logger = AppLogger();
  final ADBService adbService = ADBService(logger);
  final ConnectionService connectionService =
      ConnectionService(adbService, logger);
  final ConnectionManager connectionManager =
      ConnectionManager(adbService, connectionService);

  runApp(MyApp(connectionManager: connectionManager));
}

class MyApp extends StatelessWidget {
  final ConnectionManager connectionManager;

  MyApp({required this.connectionManager});

  @override
  Widget build(BuildContext context) {
    final AutoConnectController autoConnectController = AutoConnectController();
    autoConnectController.startAutoConnect();

    return MaterialApp(
      title: 'ADBangs',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
