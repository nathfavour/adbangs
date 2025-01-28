import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

class QRGenerator {
  static Widget generateQRCode(String pairingCode, double size) {
    return QrImageView(
      data: pairingCode,
      version: QrVersions.auto,
      size: size,
      backgroundColor: Colors.white,
    );
  }

  static String formatPairingCode(String code, String ipAddress, String port) {
    return 'WIFI:T:ADB;S:$ipAddress;P:$port;C:$code;;';
  }
}
