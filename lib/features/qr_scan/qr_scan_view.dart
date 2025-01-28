import 'package:flutter/material.dart';
import 'qr_scan_controller.dart';

class QRScanView extends StatefulWidget {
  @override
  _QRScanViewState createState() => _QRScanViewState();
}

class _QRScanViewState extends State<QRScanView> {
  final QRScanController controller = QRScanController();

  @override
  void dispose() {
    controller.disposeScanner();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR to Pair'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => controller.startScan(context),
          child: Text('Start QR Scan'),
        ),
      ),
    );
  }
}
