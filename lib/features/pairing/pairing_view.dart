import 'package:flutter/material.dart';
import 'pairing_controller.dart';

class PairingView extends StatefulWidget {
  @override
  _PairingViewState createState() => _PairingViewState();
}

class _PairingViewState extends State<PairingView> {
  final PairingController controller = PairingController();
  final TextEditingController codeController = TextEditingController();

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
