import 'package:logger/logger.dart'; // Import the logger package

class AppLogger {
  final Logger logger = Logger();

  void logInfo(String message) {
    logger.i(message); // Use the 'info' method from the logger package
  }

  void logError(String message) {
    logger.e(message); // Use the 'error' method from the logger package
  }

  void log(String message) {
    logger.v(message); // Example of a verbose log
  }

  void error(String message) {
    logger.e(message); // Alias for logError if needed
  }
}
