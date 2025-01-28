import 'package:logger/logger.dart';

class AppLogger {
  final Logger logger = Logger();

  void logInfo(String message) {
    logger.i(message);
  }

  void logError(String message) {
    logger.e(message);
  }
}
