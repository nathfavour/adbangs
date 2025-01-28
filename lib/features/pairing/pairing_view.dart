import 'package:flutter/material.dart';
import 'pairing_controller.dart';
import 'core/connectivity/connection_manager.dart'; // Import ConnectionManager

class PairingView extends StatefulWidget {
  final ConnectionManager connectionManager;

  const PairingView({super.key, required this.connectionManager});

  @override
  _PairingViewState createState() => _PairingViewState();
}

class _PairingViewState extends State<PairingView> {
  late final PairingController controller;
  final TextEditingController codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = PairingController(widget.connectionManager.connectionService);
  }

  void _pairDevice() {
    controller.pairWithCode(codeController.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pair Device'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: codeController,
              decoration: InputDecoration(labelText: 'Enter Pairing Code'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pairDevice,
              child: Text('Pair'),
            ),
          ],
        ),
      ),
    );
  }
}
