import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/models/plug_socket.dart';

class SocketToggleTile extends StatelessWidget {
  const SocketToggleTile({
    required this.socket,
    required this.onToggle,
    super.key,
  });

  final PlugSocket socket;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
              color: socket.isOn ? AppColors.success : AppColors.onSurfaceVariant,
            ),
            child: Text(socket.isOn ? 'ON' : 'OFF'),
          ),
          const SizedBox(width: 8),
          Switch.adaptive(
            value: socket.isOn,
            activeColor: AppColors.primary,
            onChanged: onToggle,
          ),
        ],
      ),
    );
  }
}
