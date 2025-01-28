import 'package:flutter/material.dart';
import 'routes.dart';
import 'core/connectivity/connection_manager.dart';
import 'core/utils/logger.dart';
import 'features/auto_connect/auto_connect_controller.dart';
import 'theme/app_theme.dart';
import 'services/connection_service.dart';

class MyApp extends StatelessWidget {
  final ConnectionManager connectionManager;

  MyApp({required this.connectionManager});

  @override
  Widget build(BuildContext context) {
    final AutoConnectController autoConnectController =
        AutoConnectController(connectionManager.connectionService.logger);
    autoConnectController.startAutoConnect();

    return MaterialApp(
      title: 'ADBangs',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      onGenerateRoute: (settings) =>
          AppRoutes.generateRoute(settings, connectionManager),
    );
  }
}
