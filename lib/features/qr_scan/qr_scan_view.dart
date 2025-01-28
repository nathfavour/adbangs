import 'package:flutter/material.dart';
import 'qr_scan_controller.dart';
import '../../core/connectivity/connection_manager.dart';

class QRScanView extends StatefulWidget {
  final ConnectionManager connectionManager;

  QRScanView({required this.connectionManager});

  @override
  _QRScanViewState createState() => _QRScanViewState();
}

class _QRScanViewState extends State<QRScanView> {
  late QRScanController controller;

  @override
  void initState() {
    super.initState();
    controller = QRScanController(widget.connectionManager.connectionService);
  }

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
