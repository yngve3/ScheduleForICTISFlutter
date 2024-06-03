import 'package:flutter/material.dart';

extension ThemeModeFromIndexExtention on ThemeMode {
  static ThemeMode fromIndex(int? index) {
    for (final mode in ThemeMode.values) {
      if (mode.index == index) return mode;
    }

    return ThemeMode.system;
  }
}