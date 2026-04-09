import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/scenes_providers.dart';

class ScenesScreen extends ConsumerWidget {
  const ScenesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scenes = ref.watch(scenesControllerProvider);
    final applyScene = ref.watch(applySceneProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Scenes')),
      body: scenes.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
        data: (items) => ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final scene = items[index];
            return ListTile(
              title: Text(scene.name),
              subtitle: Text('${scene.actions.length} actions'),
              trailing: FilledButton(
                onPressed: () => applyScene(scene),
                child: const Text('Apply'),
              ),
            );
          },
        ),
      ),
    );
  }
}
