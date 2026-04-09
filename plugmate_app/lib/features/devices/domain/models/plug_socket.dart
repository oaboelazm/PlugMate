class PlugSocket {
  const PlugSocket({
    required this.id,
    required this.name,
    required this.isOn,
  });

  final String id;
  final String name;
  final bool isOn;

  PlugSocket copyWith({
    String? id,
    String? name,
    bool? isOn,
  }) {
    return PlugSocket(
      id: id ?? this.id,
      name: name ?? this.name,
      isOn: isOn ?? this.isOn,
    );
  }
}
