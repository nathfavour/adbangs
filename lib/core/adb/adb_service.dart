import 'dart:async';
import 'dart:io';

class ADBService {
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
}
