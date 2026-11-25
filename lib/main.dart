import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/login_screen.dart';

void main() {
  runApp(const RaastaLinkApp());
}

class RaastaLinkApp extends StatelessWidget {
  const RaastaLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RaastaLink',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const LoginScreen(),
    );
  }
}