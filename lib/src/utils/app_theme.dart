import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      colorScheme: const ColorScheme.dark());

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white70,
      colorScheme: const ColorScheme.light());
}
