import '../../domain/models/scene.dart';
import '../../domain/repositories/scene_repository.dart';

class MockSceneRepository implements SceneRepository {
  @override
  Future<List<Scene>> fetchScenes() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    return const [
      Scene(
        id: 'scene-1',
        name: 'Sleep',
        actions: [
          SceneDeviceAction(deviceId: 'device-1', socketId: 'socket-1', turnOn: false),
          SceneDeviceAction(deviceId: 'device-1', socketId: 'socket-2', turnOn: false),
        ],
      ),
      Scene(
        id: 'scene-2',
        name: 'Movie Night',
        actions: [
          SceneDeviceAction(deviceId: 'device-1', socketId: 'socket-1', turnOn: true),
          SceneDeviceAction(deviceId: 'device-1', socketId: 'socket-2', turnOn: true),
        ],
      ),
    ];
  }
}
