import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class DeviceActionButton extends StatelessWidget {
  const DeviceActionButton({
    required this.label,
    required this.onPressed,
    this.isPrimary = false,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor:
            isPrimary ? AppColors.primary : AppColors.surfaceContainerHigh,
        foregroundColor: isPrimary ? Colors.black : AppColors.onSurface,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
