import 'package:logger/logger.dart';

class Logger {
  void logInfo(String message) {
    print('INFO: $message');
  }

  void logError(String message) {
    print('ERROR: $message');
  }
}

class AppLogger {
  final Logger logger = Logger();

  void logInfo(String message) {
    logger.i(message);
  }

  void logError(String message) {
    logger.e(message);
  }

  void log(String message) {
    // Implement logging logic here
    print('LOG: $message');
  }

  void error(String message) {
    // Implement error logging logic here
    print('ERROR: $message');
  }
}
