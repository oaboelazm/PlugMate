import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/models/device.dart';
import '../../domain/models/plug_socket.dart';

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
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.6,
                    ),
                  ),
                  onPressed: onTurnAllOn,
                  child: const Text('Turn All ON'),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.surfaceContainerHigh,
                    foregroundColor: AppColors.onSurface,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.6,
                    ),
                  ),
                  onPressed: onTurnAllOff,
                  child: const Text('Turn All OFF'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              children: [
                for (final socket in device.sockets) ...[
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOut,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: socket.isOn
                            ? AppColors.primary.withValues(alpha: 0.4)
                            : Colors.transparent,
                      ),
                      boxShadow: socket.isOn
                          ? [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.18),
                                blurRadius: 16,
                                spreadRadius: 1,
                              ),
                            ]
                          : const [],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            socket.name,
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 220),
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                            color: socket.isOn
                                ? AppColors.success
                                : AppColors.onSurfaceVariant,
                          ),
                          child: Text(socket.isOn ? 'ON' : 'OFF'),
                        ),
                        const SizedBox(width: 8),
                        Switch.adaptive(
                          value: socket.isOn,
                          activeColor: AppColors.primary,
                          onChanged: (_) => onSocketToggle(socket),
                        ),
                      ],
                    ),
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
