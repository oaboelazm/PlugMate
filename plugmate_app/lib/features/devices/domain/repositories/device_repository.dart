import '../models/device.dart';

abstract class DeviceRepository {
  Future<List<Device>> fetchDevices();
}
