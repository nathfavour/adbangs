import 'package:flutter/material.dart';
import 'routes.dart';
import 'core/adb/adb_service.dart';
import 'core/connectivity/connection_manager.dart';
import 'core/utils/logger.dart';
import 'features/auto_connect/auto_connect_controller.dart';
import 'theme/app_theme.dart';

class MyApp extends StatelessWidget {
  final ADBService adbService = ADBService();
  final AppLogger logger = AppLogger();

  @override
  Widget build(BuildContext context) {
    final ConnectionManager connectionManager = ConnectionManager(adbService);
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
