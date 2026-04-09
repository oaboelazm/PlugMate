import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../features/devices/presentation/screens/home_screen.dart';

class PlugMateApp extends StatelessWidget {
  const PlugMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlugMate',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const HomeScreen(),
    );
  }
}
