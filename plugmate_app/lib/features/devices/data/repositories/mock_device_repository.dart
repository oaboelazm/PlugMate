import 'dart:ui';

import '../../domain/models/device.dart';
import '../../domain/models/plug_socket.dart';
import '../../domain/repositories/device_repository.dart';

class MockDeviceRepository implements DeviceRepository {
  @override
  Future<List<Device>> fetchDevices() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));

    return const [
      Device(
        id: 'device-1',
        name: 'Living Room Strip',
        status: DeviceStatus.online,
        color: Color(0xFF00E5FF),
        sockets: [
          PlugSocket(id: 'socket-1', name: 'Smart TV', isOn: true),
          PlugSocket(id: 'socket-2', name: 'Soundbar', isOn: true),
          PlugSocket(id: 'socket-3', name: 'Console', isOn: false),
          PlugSocket(id: 'socket-4', name: 'Floor Lamp', isOn: true),
        ],
      ),
      Device(
        id: 'device-2',
        name: 'Bedroom Strip',
        status: DeviceStatus.online,
        color: Color(0xFFD8B9FF),
        sockets: [
          PlugSocket(id: 'socket-5', name: 'Desk Lamp', isOn: false),
          PlugSocket(id: 'socket-6', name: 'Monitor', isOn: true),
          PlugSocket(id: 'socket-7', name: 'Charger', isOn: true),
          PlugSocket(id: 'socket-8', name: 'Speaker', isOn: false),
        ],
      ),
    ];
  }
}
