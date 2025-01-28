import 'package:flutter/material.dart';
import '../widgets/device_list.dart';
import '../widgets/dashboard_card.dart';
import '../core/adb/adb_service.dart';
import '../core/connectivity/connection_manager.dart';
import '../core/utils/logger.dart';
import '../../services/connection_service.dart';
import '../../core/utils/logger.dart';

class HomeScreen extends StatefulWidget {
  final ConnectionManager connectionManager;

  HomeScreen({required this.connectionManager});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppLogger logger = AppLogger();
  final ADBService adbService = ADBService(logger);
  final ConnectionService connectionService;

  _HomeScreenState()
      : connectionService =
            ConnectionService(ADBService(AppLogger()), AppLogger());

  List<String> devices = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchDevices();
    widget.connectionManager.startAutoConnect();
  }

  Future<void> fetchDevices() async {
    setState(() => isLoading = true);
    devices = await adbService.getConnectedDevices();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADBangs Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: fetchDevices,
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // TODO: Implement settings
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: fetchDevices,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildListDelegate([
                  DashboardCard(
                    title: 'Pair Device',
                    icon: Icons.qr_code_scanner,
                    onTap: () => Navigator.pushNamed(context, '/pair'),
                  ),
                  DashboardCard(
                    title: 'Reload App',
                    icon: Icons.refresh,
                    onTap: () {
                      // TODO: Implement reload app
                    },
                  ),
                  DashboardCard(
                    title: 'Restart Debugger',
                    icon: Icons.bug_report,
                    onTap: () {
                      // TODO: Implement restart debugger
                    },
                  ),
                  DashboardCard(
                    title: 'Device Logs',
                    icon: Icons.list_alt,
                    onTap: () {
                      // TODO: Implement device logs
                    },
                  ),
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Connected Devices',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Card(
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : DeviceList(devices: devices),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Implement quick actions menu
        },
        label: Text('Quick Actions'),
        icon: Icon(Icons.flash_on),
      ),
    );
  }

  @override
  void dispose() {
    widget.connectionManager.stopAutoConnect();
    super.dispose();
  }
}
