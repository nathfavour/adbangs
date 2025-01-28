import 'dart:async';
import 'dart:io';
import '../../services/connection_service.dart';

class ADBService {
  final ConnectionService connectionService;

  ADBService(this.connectionService);

  Future<List<String>> getConnectedDevices() async {
    final result = await Process.run('adb', ['devices']);
    if (result.exitCode == 0) {
      final lines = result.stdout.toString().split('\n');
      return lines
          .where((line) => line.endsWith('device'))
          .map((line) => line.split('\t').first)
          .toList();
    }
    return [];
  }

  Future<void> connectToDevice(String ip) async {
    await Process.run('adb', ['connect', ip]);
  }

  Future<void> disconnectFromDevice(String ip) async {
    await Process.run('adb', ['disconnect', ip]);
  }

  Future<void> pairWithCode(String code) async {
    await Process.run('adb', ['pair', code]);
  }

  Future<bool> connect(String ip) async {
    final result = await Process.run('adb', ['connect', ip]);
    if (result.exitCode == 0) {
      return true;
    }
    connectionService.logError('Failed to connect to $ip: ${result.stderr}');
    return false;
  }

  Future<void> disconnect(String ip) async {
    final result = await Process.run('adb', ['disconnect', ip]);
    if (result.exitCode != 0) {
      connectionService
          .logError('Failed to disconnect from $ip: ${result.stderr}');
    }
  }
}
