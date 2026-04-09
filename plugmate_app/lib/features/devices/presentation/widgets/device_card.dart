import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/models/device.dart';
import '../../domain/models/plug_socket.dart';
import 'device_action_button.dart';
import 'socket_toggle_tile.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({
    required this.device,
    required this.onTurnAllOn,
    required this.onTurnAllOff,
    required this.onSocketToggle,
    super.key,
  });

  final Device device;
  final VoidCallback onTurnAllOn;
  final VoidCallback onTurnAllOff;
  final ValueChanged<PlugSocket> onSocketToggle;

  @override
  Widget build(BuildContext context) {
    final statusColor = device.isOnline ? AppColors.success : AppColors.onSurfaceVariant;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: device.color.withValues(alpha: 0.22),
                  child: Icon(
                    Icons.power,
                    color: device.color,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    device.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: statusColor.withValues(alpha: 0.5),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  device.isOnline ? 'Online' : 'Offline',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: AppColors.onSurfaceVariant),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                DeviceActionButton(
                  label: 'Turn All ON',
                  isPrimary: true,
                  onPressed: onTurnAllOn,
                ),
                const SizedBox(width: 8),
                DeviceActionButton(
                  label: 'Turn All OFF',
                  onPressed: onTurnAllOff,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              children: [
                for (final socket in device.sockets) ...[
                  SocketToggleTile(
                    socket: socket,
                    onToggle: (_) => onSocketToggle(socket),
                  ),
                  if (socket.id != device.sockets.last.id)
                    const SizedBox(height: 8),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
