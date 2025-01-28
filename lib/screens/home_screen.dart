import 'package:flutter/material.dart';
import '../widgets/device_list.dart';
import '../widgets/custom_button.dart';
import '../core/adb/adb_service.dart';
import '../core/connectivity/connection_manager.dart';
import '../core/utils/logger.dart';
import 'pair_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ADBService adbService = ADBService();
  final ConnectionManager connectionManager = ConnectionManager(ADBService());
  final AppLogger logger = AppLogger();
  List<String> devices = [];

  @override
  void initState() {
    super.initState();
    fetchDevices();
    connectionManager.startAutoConnect();
  }

  Future<void> fetchDevices() async {
    devices = await adbService.getConnectedDevices();
    setState(() {});
  }

  @override
  void dispose() {
    connectionManager.stopAutoConnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADBangs'),
      ),
      body: Column(
        children: [
          Expanded(child: DeviceList(devices: devices)),
          CustomButton(
            label: 'Pair Device',
            onPressed: () {
              Navigator.pushNamed(context, '/pair');
            },
          ),
        ],
      ),
    );
  }
}
