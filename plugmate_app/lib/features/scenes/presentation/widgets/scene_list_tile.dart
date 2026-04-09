import 'package:flutter/material.dart';

import '../../domain/models/scene.dart';

class SceneListTile extends StatelessWidget {
  const SceneListTile({
    required this.scene,
    required this.onApply,
    super.key,
  });

  final Scene scene;
  final VoidCallback onApply;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(scene.name),
      subtitle: Text('${scene.actions.length} actions'),
      trailing: FilledButton(
        onPressed: onApply,
        child: const Text('Apply'),
      ),
    );
  }
}
