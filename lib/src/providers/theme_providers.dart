import 'package:benders_shared_prefs/src/constants/keys.dart';
import 'package:benders_shared_prefs/src/utils/app_theme.dart';
import 'package:benders_shared_prefs/src/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends StateNotifier<ThemeData> {
  ThemeProvider() : super(AppTheme.lightTheme) {
    _loadTheme();
  }

  void _loadTheme() async {
    final isLightMode =
        await UserSharedPreferences.getBool(LocalKeys.isLightMode);
    state = isLightMode ? AppTheme.lightTheme : AppTheme.darkTheme;
  }

  void toggleTheme() async {
    final isLightMode =
        await UserSharedPreferences.getBool(LocalKeys.isLightMode);

    UserSharedPreferences.setBool(LocalKeys.isLightMode, !isLightMode);

    state = !isLightMode ? AppTheme.lightTheme : AppTheme.darkTheme;
  }
}

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeData>((ref) {
  return ThemeProvider();
});
