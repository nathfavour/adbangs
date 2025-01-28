import 'package:adbangs/core/connectivity/connection_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/qr_generator.dart';
import '../widgets/pairing_method_card.dart';

class PairScreen extends StatefulWidget {
  const PairScreen({super.key, required ConnectionManager connectionManager});

  @override
  _PairScreenState createState() => _PairScreenState();
}

class _PairScreenState extends State<PairScreen> {
  String _pairingCode = ''; // Change to non-nullable with empty default
  String _ipAddress = '192.168.1.100'; // Example IP
  String _port = '5555';
  bool _showQRCode = false;

  @override
  void initState() {
    super.initState();
    _generatePairingCode();
  }

  Future<void> _generatePairingCode() async {
    // In a real app, generate this from your ADB service
    setState(() => _pairingCode = '123456');
  }

  Widget _buildQRCodeView() {
    if (_pairingCode.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          QRGenerator.generateQRCode(
            QRGenerator.formatPairingCode(_pairingCode, _ipAddress, _port),
            200,
          ),
          SizedBox(height: 16),
          Text(
            'Scan this QR code in Android Settings\nWireless debugging section',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pairing code: $_pairingCode',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: _pairingCode));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Pairing code copied to clipboard')),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildManualPairingForm() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'IP Address',
              hintText: 'Enter device IP address',
            ),
            onChanged: (value) => _ipAddress = value,
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Port',
              hintText: 'Enter port number',
            ),
            onChanged: (value) => _port = value,
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement manual pairing
            },
            child: Text('Connect'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pair New Device'),
        actions: [
          if (_showQRCode)
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _generatePairingCode,
            ),
        ],
      ),
      body: _showQRCode
          ? _buildQRCodeView()
          : ListView(
              children: [
                PairingMethodCard(
                  title: 'QR Code Pairing',
                  description: 'Quickly pair by scanning a QR code',
                  icon: Icons.qr_code,
                  onTap: () => setState(() => _showQRCode = true),
                ),
                PairingMethodCard(
                  title: 'Manual IP Pairing',
                  description: 'Enter IP address and port manually',
                  icon: Icons.router,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: _buildManualPairingForm(),
                        ),
                      ),
                    );
                  },
                ),
                PairingMethodCard(
                  title: 'USB Pairing',
                  description: 'Connect using USB cable first',
                  icon: Icons.usb,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('USB Pairing Instructions'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('1. Connect your device via USB'),
                            Text('2. Enable USB debugging on your device'),
                            Text('3. Accept the USB debugging prompt'),
                            Text('4. Click "Pair Device" below'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // TODO: Implement USB pairing
                              Navigator.pop(context);
                            },
                            child: Text('Pair Device'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
