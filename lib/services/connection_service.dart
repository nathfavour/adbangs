import '../core/adb/adb_service.dart';
import '../core/utils/logger.dart';

class ConnectionService {
  final ADBService adbService;
  final Logger logger;

  ConnectionService(this.adbService, this.logger);

  Future<bool> connectToDevice(String ip) async {
    try {
      bool result = await adbService.connect(ip);
      if (result) {
        logger.logInfo('Connected to $ip');
      }
      return result;
    } catch (e) {
      logger.logError('Connection failed: $e');
      return false;
    }
  }

  Future<void> disconnectDevice(String ip) async {
    try {
      await adbService.disconnect(ip);
      logger.logInfo('Disconnected from $ip');
    } catch (e) {
      logger.logError('Disconnection failed: $e');
    }
  }

  Future<List<String>> getConnectedDevices() async {
    return await adbService.getConnectedDevices();
  }

  Future<void> pairWithCode(String code) async {
    try {
      await adbService.pairWithCode(code);
      logger.logInfo('Paired with code: $code');
    } catch (e) {
      logger.logError('Pairing failed: $e');
    }
  }

  void logInfo(String message) {
    logger.logInfo(message);
  }

  void logError(String message) {
    logger.logError(message);
  }
}
