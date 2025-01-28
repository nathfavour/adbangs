import 'package:flutter/material.dart';

class DeviceList extends StatelessWidget {
  final List<String> devices;

  const DeviceList({super.key, required this.devices});

  @override
  Widget build(BuildContext context) {
    if (devices.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.devices, size: 48, color: Colors.grey),
              SizedBox(height: 16),
              Text('No devices connected'),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: devices.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.phone_android),
          title: Text(devices[index]),
          trailing: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              showDeviceActions(context, devices[index]);
            },
          ),
        );
      },
    );
  }

  void showDeviceActions(BuildContext context, String device) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.refresh),
            title: Text('Restart App'),
            onTap: () {
              // TODO: Implement restart app
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.bug_report),
            title: Text('Start Debugging'),
            onTap: () {
              // TODO: Implement debug
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Disconnect'),
            onTap: () {
              // TODO: Implement disconnect
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
