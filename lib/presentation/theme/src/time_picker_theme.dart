import 'package:flutter/material.dart';

import '../theme_ext/colors_ext.dart';

TimePickerThemeData timePickerThemeData(ThemeColors colors) => TimePickerThemeData(
  backgroundColor: colors.background,
  dialHandColor: colors.accent,
  dialBackgroundColor: colors.card,
  hourMinuteColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? colors.accent.withOpacity(0.12) : colors.card),
  hourMinuteTextColor: colors.text1,
  elevation: 0,
);