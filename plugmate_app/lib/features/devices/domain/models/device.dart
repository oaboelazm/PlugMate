import 'dart:ui';
import 'plug_socket.dart';

enum DeviceStatus { online, offline }

class Device {
  const Device({
    required this.id,
    required this.name,
    required this.status,
    required this.color,
    required this.sockets,
  });

  final String id;
  final String name;
  final DeviceStatus status;
  final Color color;
  final List<PlugSocket> sockets;

  bool get isOnline => status == DeviceStatus.online;

  Device copyWith({
    String? id,
    String? name,
    DeviceStatus? status,
    Color? color,
    List<PlugSocket>? sockets,
  }) {
    return Device(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      color: color ?? this.color,
      sockets: sockets ?? this.sockets,
    );
  }
}
