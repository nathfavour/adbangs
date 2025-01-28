import 'package:flutter/material.dart';
import 'app.dart';
import 'core/connectivity/connection_manager.dart'; // Import ConnectionManager

void main() {
  final connectionManager = ConnectionManager(); // Initialize ConnectionManager
  runApp(MyApp(connectionManager: connectionManager));
}
