import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/widgets/async_value_view.dart';
import '../../domain/models/device.dart';
import '../../domain/models/plug_socket.dart';
import 'device_card.dart';

class DevicesHomeTab extends StatelessWidget {
  const DevicesHomeTab({
    required this.devices,
    required this.onTurnAllOn,
    required this.onTurnAllOff,
    required this.onSocketToggle,
    super.key,
  });

  final AsyncValue<List<Device>> devices;
  final ValueChanged<Device> onTurnAllOn;
  final ValueChanged<Device> onTurnAllOff;
  final void Function(Device device, PlugSocket socket) onSocketToggle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PlugMate')),
      body: AsyncValueView<List<Device>>(
        value: devices,
        data: (items) => ListView.builder(
          padding: const EdgeInsets.only(top: 8, bottom: 24),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final device = items[index];
            return DeviceCard(
              device: device,
              onTurnAllOn: () => onTurnAllOn(device),
              onTurnAllOff: () => onTurnAllOff(device),
              onSocketToggle: (socket) => onSocketToggle(device, socket),
            );
          },
        ),
      ),
    );
  }
}
