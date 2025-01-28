import 'dart:async';
import 'package:process_run/shell.dart';

class ADBService {
  final Shell _shell;

  ADBService({Shell? shell}) : _shell = shell ?? Shell();

  Future<List<String>> getConnectedDevices() async {
    try {
      final result = await _shell.run('adb devices');
      final lines = result.first.stdout.toString().split('\n');
      final devices = <String>[];
      for (var line in lines.skip(1)) {
        // Skip the header line
        if (line.trim().isEmpty) continue;
        final parts = line.split('\t');
        if (parts.length >= 2 && parts[1] == 'device') {
          devices.add(parts[0]);
        }
      }
      return devices;
    } catch (e) {
      // Handle errors appropriately
      return [];
    }
  }

  Future<bool> connect(String device) async {
    try {
      final result = await _shell.run('adb connect $device');
      // Check if the connection was successful
      return result.any(
          (cmdResult) => cmdResult.stdout.toString().contains('connected to'));
    } catch (e) {
      // Handle errors appropriately
      return false;
    }
  }

  Future<void> connectToDevice(String qrData) async {
    // Assuming qrData contains the device IP or identifier
    await connect(qrData);
  }
}
