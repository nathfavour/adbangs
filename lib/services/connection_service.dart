import '../core/adb/adb_service.dart';
import '../core/utils/logger.dart';

class ConnectionService {
  final ADBService adbService;
  final AppLogger logger;

  ConnectionService(this.adbService, this.logger);

  Future<bool> connectToDevice(String ip) async {
    try {
      bool result = await adbService.connect(ip);
      if (result) {
        logger.log('Connected to $ip');
      }
      return result;
    } catch (e) {
      logger.error('Connection failed: $e');
      return false;
    }
  }

  Future<void> disconnectDevice(String ip) async {
    try {
      await adbService.disconnect(ip);
      logger.log('Disconnected from $ip');
    } catch (e) {
      logger.error('Disconnection failed: $e');
    }
  }

  Future<List<String>> getConnectedDevices() async {
    return await adbService.getConnectedDevices();
  }

  Future<void> pairWithCode(String code) async {
    // Implement pairing logic
  }

  void logInfo(String message) {
    logger.logInfo(message);
  }

  void logError(String message) {
    logger.logError(message);
  }
}
