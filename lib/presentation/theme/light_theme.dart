import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/color_schemes.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/button_theme.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/card_theme.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/decorator_theme.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/table_calendar/calendar_theme.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/table_calendar/days_of_week_theme.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/table_calendar/table_calendar_theme.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/text_theme.dart';

class AppTheme {
  static get light => _createTheme(AppColorScheme.light);
  static get dark => _createTheme(AppColorScheme.dark);
  
  static ThemeData _createTheme(ColorScheme colorScheme) {
    final textTheme = textThemeData(colorScheme);
    final cardTheme = cardThemeData();
    final inputDecoratorTheme = inputDecorationThemeData(textTheme);
    final floatingActionButtonTheme = floatingActionButtonThemeData();
    final filledButtonTheme = filledButtonThemeData(textTheme);
    final tableCalendarTheme = TableCalendarTheme(
        daysOfWeekStyle: daysOfWeekStyleData(textTheme),
        calendarStyle: calendarStyleData(colorScheme, textTheme)
    );

    return ThemeData(
        useMaterial3: true,
        extensions: [
          tableCalendarTheme
        ],
        colorScheme: colorScheme,
        cardTheme: cardTheme,
        filledButtonTheme: filledButtonTheme,
        splashColor: Colors.transparent,
        floatingActionButtonTheme: floatingActionButtonTheme,
        inputDecorationTheme: inputDecoratorTheme,
        textTheme: textTheme,
    );
  }
}