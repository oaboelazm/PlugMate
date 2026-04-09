import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../pairing/presentation/screens/pairing_screen.dart';
import '../../../scenes/presentation/screens/scenes_screen.dart';
import '../providers/device_providers.dart';
import '../widgets/device_card.dart';

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
    final controller = ref.read(deviceControllerProvider.notifier);

    final pages = [
      Scaffold(
        appBar: AppBar(title: const Text('PlugMate')),
        body: devices.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('Error: $error')),
          data: (items) => ListView.builder(
            padding: const EdgeInsets.only(top: 8, bottom: 24),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final device = items[index];
              return DeviceCard(
                device: device,
                onTurnAllOn: () => controller.setAllSockets(
                  deviceId: device.id,
                  isOn: true,
                ),
                onTurnAllOff: () => controller.setAllSockets(
                  deviceId: device.id,
                  isOn: false,
                ),
                onSocketToggle: (socket) => controller.toggleSocket(
                  deviceId: device.id,
                  socketId: socket.id,
                ),
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
