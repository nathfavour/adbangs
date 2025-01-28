import 'dart:async';
import '../adb/adb_service.dart';
import '../../services/connection_service.dart';

class ConnectionManager {
  final ADBService adbService;
  final ConnectionService connectionService;
  Timer? _autoConnectTimer;

  ConnectionManager(this.adbService, this.connectionService);

  void startAutoConnect() {
    _autoConnectTimer = Timer.periodic(Duration(seconds: 30), (_) async {
      final devices = await adbService.getConnectedDevices();
      for (var device in devices) {
        final success = await adbService.connect(device);
        if (success) {
          connectionService.logInfo('Auto-connected to device: $device');
        } else {
          connectionService.logError('Auto-connect failed for device: $device');
        }
      }
    });
  }

  void stopAutoConnect() {
    _autoConnectTimer?.cancel();
  }

  Future<void> pairWithQr(String qrData) async {
    // Parse QR data to extract IP or code
    await adbService.connectToDevice(qrData);
  }

  Future<void> pairWithCode(String code) async {
    await connectionService.pairWithCode(code);
  }
}
