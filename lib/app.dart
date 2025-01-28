import 'package:flutter/material.dart';
import 'routes.dart';
import 'core/connectivity/connection_manager.dart';
import 'features/auto_connect/auto_connect_controller.dart';
import 'theme/app_theme.dart';

class MyApp extends StatelessWidget {
  final ConnectionManager connectionManager;

  MyApp({required this.connectionManager});

  @override
  Widget build(BuildContext context) {
    final autoConnectController =
        AutoConnectController(connectionManager.connectionService);
    autoConnectController.startAutoConnect();

    final appRoutes = AppRoutes(
        connectionManager); // Initialize AppRoutes with connectionManager

    return MaterialApp(
      title: 'ADBangs',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      onGenerateRoute: appRoutes.generateRoute, // Updated line
    );
  }
}
