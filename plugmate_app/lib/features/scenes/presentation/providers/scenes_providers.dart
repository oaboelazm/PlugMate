import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../devices/presentation/providers/device_providers.dart';
import '../../data/repositories/mock_scene_repository.dart';
import '../../domain/models/scene.dart';
import '../../domain/repositories/scene_repository.dart';

final sceneRepositoryProvider = Provider<SceneRepository>((ref) {
  return MockSceneRepository();
});

final scenesControllerProvider =
    StateNotifierProvider<ScenesController, AsyncValue<List<Scene>>>((ref) {
  final repository = ref.watch(sceneRepositoryProvider);
  return ScenesController(repository)..loadScenes();
});

class ScenesController extends StateNotifier<AsyncValue<List<Scene>>> {
  ScenesController(this._repository) : super(const AsyncValue.loading());

  final SceneRepository _repository;

  Future<void> loadScenes() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_repository.fetchScenes);
  }
}

final applySceneProvider = Provider<void Function(Scene)>((ref) {
  return (scene) {
    final deviceController = ref.read(deviceControllerProvider.notifier);

    for (final action in scene.actions) {
      final socketsState = ref.read(deviceControllerProvider).valueOrNull;
      final isCurrentlyOn = socketsState
          ?.where((d) => d.id == action.deviceId)
          .expand((d) => d.sockets)
          .where((s) => s.id == action.socketId)
          .map((s) => s.isOn)
          .firstOrNull;

      if (isCurrentlyOn != action.turnOn) {
        deviceController.toggleSocket(
          deviceId: action.deviceId,
          socketId: action.socketId,
        );
      }
    }
  };
});

extension<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
