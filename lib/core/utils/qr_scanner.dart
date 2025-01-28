import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

typedef OnQrData = void Function(String data);

class QRScanner extends StatefulWidget {
  final OnQrData onQrData;

  const QRScanner({super.key, required this.onQrData});

  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      widget.onQrData(scanData.code ?? '');
      controller.dispose();
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
