import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/mock_device_repository.dart';
import '../../domain/models/device.dart';
import '../../domain/models/plug_socket.dart';
import '../../domain/repositories/device_repository.dart';

final deviceRepositoryProvider = Provider<DeviceRepository>((ref) {
  return MockDeviceRepository();
});

final deviceControllerProvider =
    StateNotifierProvider<DeviceController, AsyncValue<List<Device>>>((ref) {
  final repository = ref.watch(deviceRepositoryProvider);
  return DeviceController(repository)..loadDevices();
});

class DeviceController extends StateNotifier<AsyncValue<List<Device>>> {
  DeviceController(this._repository) : super(const AsyncValue.loading());

  final DeviceRepository _repository;

  Future<void> loadDevices() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_repository.fetchDevices);
  }

  void toggleSocket({required String deviceId, required String socketId}) {
    final current = state.valueOrNull;
    if (current == null) return;

    final updated = current.map((device) {
      if (device.id != deviceId) return device;

      final sockets = device.sockets.map((socket) {
        if (socket.id != socketId) return socket;
        return socket.copyWith(isOn: !socket.isOn);
      }).toList(growable: false);

      return device.copyWith(sockets: sockets);
    }).toList(growable: false);

    state = AsyncValue.data(updated);
  }

  void setAllSockets({required String deviceId, required bool isOn}) {
    final current = state.valueOrNull;
    if (current == null) return;

    final updated = current.map((device) {
      if (device.id != deviceId) return device;

      final sockets = device.sockets
          .map((socket) => socket.copyWith(isOn: isOn))
          .toList(growable: false);

      return device.copyWith(sockets: sockets);
    }).toList(growable: false);

    state = AsyncValue.data(updated);
  }

  void updateConnectionStatus({
    required String deviceId,
    required DeviceStatus status,
  }) {
    final current = state.valueOrNull;
    if (current == null) return;

    state = AsyncValue.data(
      current
          .map((device) => device.id == deviceId
              ? device.copyWith(status: status)
              : device)
          .toList(growable: false),
    );
  }
}
