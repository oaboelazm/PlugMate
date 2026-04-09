import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/pairing_providers.dart';

class PairingScreen extends ConsumerWidget {
  const PairingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pairingControllerProvider);
    final controller = ref.read(pairingControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Pairing')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Status: ${state.status.name}'),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: state.status == ConnectionStatus.scanning
                  ? null
                  : controller.startScan,
              child: const Text('Start Scan'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: controller.reset,
              child: const Text('Reset'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: state.discoveredDevices.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(state.discoveredDevices[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
