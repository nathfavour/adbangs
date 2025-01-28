import 'package:flutter/material.dart';

class DeviceList extends StatelessWidget {
  final List<String> devices;

  DeviceList({required this.devices});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: devices.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(devices[index]),
        );
      },
    );
  }
}
