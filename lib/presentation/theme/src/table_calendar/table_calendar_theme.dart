import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calendar_theme.dart';
import 'days_of_week_theme.dart';

class TableCalendarTheme extends ThemeExtension<TableCalendarTheme> {

  final DaysOfWeekStyle daysOfWeekStyle;
  final CalendarStyle calendarStyle;
  final bool headerVisible;

  TableCalendarTheme({
    required this.daysOfWeekStyle,
    required this.calendarStyle,
    this.headerVisible = false
  });

  @override
  ThemeExtension<TableCalendarTheme> copyWith({
    DaysOfWeekStyle? daysOfWeekStyle,
    CalendarStyle? calendarStyle,
    bool? headerVisible
  }) {
    return TableCalendarTheme(
        daysOfWeekStyle: daysOfWeekStyle ?? this.daysOfWeekStyle,
        calendarStyle: calendarStyle ?? this.calendarStyle,
        headerVisible: headerVisible ?? this.headerVisible
    );
  }

  @override
  ThemeExtension<TableCalendarTheme> lerp(covariant ThemeExtension<TableCalendarTheme>? other, double t) {
    if (other is! TableCalendarTheme) {
      return this;
    }

    return TableCalendarTheme(
        daysOfWeekStyle: DaysOfWeekStyleLerp.lerp(daysOfWeekStyle, other.daysOfWeekStyle, t),
        calendarStyle: CalendarStyleLerp.lerp(calendarStyle, other.calendarStyle, t),
        headerVisible: headerVisible
    );
  }

}