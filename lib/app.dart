import 'package:flutter/material.dart';

import 'ui/common/app_theme.dart';
import 'views/shell_view.dart';
import 'views/splash_view.dart';

class ConnoisseurApp extends StatefulWidget {
  const ConnoisseurApp({super.key});

  @override
  State<ConnoisseurApp> createState() => _ConnoisseurAppState();
}

class _ConnoisseurAppState extends State<ConnoisseurApp> {
  bool _showSplash = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connoisseur Club',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: _showSplash
          ? SplashView(onComplete: () => setState(() => _showSplash = false))
          : const ShellView(),
    );
  }
}
