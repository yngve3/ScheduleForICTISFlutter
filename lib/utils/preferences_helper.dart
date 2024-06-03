import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/theme_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static const themeModeConst = "theme_mode";

  static Future<ThemeMode> get themeMode async {
    final prefs = await SharedPreferences.getInstance();
    final modeInt = prefs.getInt(themeModeConst);
    return ThemeModeFromIndexExtention.fromIndex(modeInt);
  }

  static void setThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(themeModeConst, mode.index);
  }
}