import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../services/connection_service.dart';
import '../../core/adb/adb_service.dart';
import '../../core/utils/logger.dart';

class QRScanController {
  final ConnectionService connectionService =
      ConnectionService(ADBService(), AppLogger());

  void startScan() {
    // Implement QR scanning logic using qr_code_scanner package
    // On successful scan, extract IP and initiate connection
  }

  void disposeScanner() {
    // Dispose QR scanner resources if any
  }
}
