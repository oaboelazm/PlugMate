class SceneDeviceAction {
  const SceneDeviceAction({
    required this.deviceId,
    required this.socketId,
    required this.turnOn,
  });

  final String deviceId;
  final String socketId;
  final bool turnOn;
}

class Scene {
  const Scene({
    required this.id,
    required this.name,
    required this.actions,
  });

  final String id;
  final String name;
  final List<SceneDeviceAction> actions;
}
