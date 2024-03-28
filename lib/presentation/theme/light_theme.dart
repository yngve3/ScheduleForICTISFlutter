import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/button_theme.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/card_theme.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/decorator_theme.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/table_calendar/calendar_theme.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/table_calendar/days_of_week_theme.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/table_calendar/table_calendar_theme.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/text_theme.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/theme_ext/colors_ext.dart';


ThemeData lightTheme() {
  final customColors = ThemeColors.light;
  final textTheme = textThemeData(customColors);
  final cardTheme = cardThemeData(customColors);
  final inputDecoratorTheme = inputDecorationThemeData(customColors, textTheme);
  final floatingActionButtonTheme = floatingActionButtonThemeData(customColors);
  final filledButtonTheme = filledButtonThemeData(customColors, textTheme);
  final tableCalendarTheme = TableCalendarTheme(
    daysOfWeekStyle: daysOfWeekStyleData(textTheme),
    calendarStyle: calendarStyleData(customColors, textTheme)
  );

  return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      extensions: [
        customColors,
        tableCalendarTheme
      ],
      cardTheme: cardTheme,
      filledButtonTheme: filledButtonTheme,
      splashColor: Colors.transparent,
      floatingActionButtonTheme: floatingActionButtonTheme,
      inputDecorationTheme: inputDecoratorTheme,
      textTheme: textTheme
  );
}