import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/widgets/async_value_view.dart';
import '../providers/scenes_providers.dart';
import '../widgets/scene_list_tile.dart';

class ScenesScreen extends ConsumerWidget {
  const ScenesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scenes = ref.watch(scenesControllerProvider);
    final applyScene = ref.watch(applySceneCallbackProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Scenes')),
      body: AsyncValueView(
        value: scenes,
        builder: (items) => ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final scene = items[index];
            return SceneListTile(
              scene: scene,
              onApply: () => applyScene(scene),
            );
          },
        ),
      ),
    );
  }
}
