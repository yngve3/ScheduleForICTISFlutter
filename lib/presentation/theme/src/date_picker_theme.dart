import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/theme_ext/colors_ext.dart';

DatePickerThemeData datePickerThemeData(ThemeColors colors) => DatePickerThemeData(
  backgroundColor: colors.background,
  elevation: 0,
  headerForegroundColor: colors.text1,
  dayBackgroundColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? colors.accent : null),
  todayBackgroundColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? colors.accent : null),
  todayForegroundColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? null : colors.accent)
);

