import '../../domain/repositories/pairing_repository.dart';

class MockPairingRepository implements PairingRepository {
  @override
  Future<List<String>> scanDevices() async {
    await Future<void>.delayed(const Duration(milliseconds: 900));
    return const [
      'PlugMate Strip X1',
      'PlugMate Bulb L2',
      'PlugMate Bridge Pro',
    ];
  }
}
