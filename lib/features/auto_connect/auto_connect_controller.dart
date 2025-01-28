import 'package:adbangs/services/connection_service.dart';

class AutoConnectController {
  final ConnectionService connectionService;

  AutoConnectController(this.connectionService);

  void startAutoConnect() {
    // Implement logic to auto connect to known devices on startup
    connectionService.getConnectedDevices().then((devices) {
      for (var device in devices) {
        connectionService.connectToDevice(device);
      }
    });
  }

  void stopAutoConnect() {
    // Implement logic to stop auto connecting if needed
  }
}
