import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/mock_pairing_repository.dart';
import '../../domain/repositories/pairing_repository.dart';

enum ConnectionStatus { idle, scanning, connecting, connected, failed }

class PairingState {
  const PairingState({
    required this.status,
    required this.discoveredDevices,
  });

  final ConnectionStatus status;
  final List<String> discoveredDevices;

  PairingState copyWith({
    ConnectionStatus? status,
    List<String>? discoveredDevices,
  }) {
    return PairingState(
      status: status ?? this.status,
      discoveredDevices: discoveredDevices ?? this.discoveredDevices,
    );
  }
}

final pairingRepositoryProvider = Provider<PairingRepository>((ref) {
  return MockPairingRepository();
});

final pairingControllerProvider =
    StateNotifierProvider<PairingController, PairingState>((ref) {
  final repository = ref.watch(pairingRepositoryProvider);
  return PairingController(repository);
});

class PairingController extends StateNotifier<PairingState> {
  PairingController(this._repository)
      : super(const PairingState(status: ConnectionStatus.idle, discoveredDevices: []));

  final PairingRepository _repository;

  Future<void> startScan() async {
    state = state.copyWith(status: ConnectionStatus.scanning, discoveredDevices: []);

    try {
      final devices = await _repository.scanDevices();
      state = state.copyWith(
        status: ConnectionStatus.connected,
        discoveredDevices: devices,
      );
    } catch (_) {
      state = state.copyWith(status: ConnectionStatus.failed);
    }
  }

  void reset() {
    state = const PairingState(status: ConnectionStatus.idle, discoveredDevices: []);
  }
}
