import '../models/scene.dart';

abstract class SceneRepository {
  Future<List<Scene>> fetchScenes();
}
