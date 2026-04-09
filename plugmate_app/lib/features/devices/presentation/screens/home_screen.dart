import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../pairing/presentation/screens/pairing_screen.dart';
import '../../../scenes/presentation/screens/scenes_screen.dart';
import '../providers/device_providers.dart';
import '../widgets/devices_home_tab.dart';

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
      DevicesHomeTab(
        devices: devices,
        onTurnAllOn: (device) => controller.setAllSockets(
          deviceId: device.id,
          isOn: true,
        ),
        onTurnAllOff: (device) => controller.setAllSockets(
          deviceId: device.id,
          isOn: false,
        ),
        onSocketToggle: (device, socket) => controller.toggleSocket(
          deviceId: device.id,
          socketId: socket.id,
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
