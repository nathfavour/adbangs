import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../services/connection_service.dart';
import '../../core/adb/adb_service.dart';
import '../../core/utils/logger.dart';
import '../../core/utils/qr_scanner.dart';
import '../../features/pairing/pairing_controller.dart';

class QRScanController {
  final ConnectionService connectionService =
      ConnectionService(ADBService(), AppLogger());
  final PairingController pairingController = PairingController();

  void startScan(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => QRScanner(
        onQrData: (data) async {
          try {
            await pairingController.pairWithCode(data);
            connectionService.logInfo('QR pairing successful: $data');
            // Optionally, show a success message to the user
          } catch (e) {
            connectionService.logError('QR pairing failed: $e');
            // Optionally, show an error message to the user
          }
          Navigator.pop(context);
        },
      ),
    );
  }

  void disposeScanner() {
    // Dispose QR scanner resources if any
  }
}
