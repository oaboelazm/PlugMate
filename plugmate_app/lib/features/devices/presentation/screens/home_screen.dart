import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../pairing/presentation/screens/pairing_screen.dart';
import '../../../scenes/presentation/screens/scenes_screen.dart';
import '../providers/device_providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final devices = ref.watch(deviceControllerProvider);

    final pages = [
      Scaffold(
        appBar: AppBar(title: const Text('PlugMate')),
        body: devices.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('Error: $error')),
          data: (items) => ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final device = items[index];
              return ListTile(
                title: Text(device.name),
                subtitle: Text(device.isOnline ? 'Online' : 'Offline'),
              );
            },
          ),
        ),
      ),
      const ScenesScreen(),
      const PairingScreen(),
    ];

    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.palette), label: 'Scenes'),
          NavigationDestination(icon: Icon(Icons.wifi_tethering), label: 'Pair'),
        ],
      ),
    );
  }
}
