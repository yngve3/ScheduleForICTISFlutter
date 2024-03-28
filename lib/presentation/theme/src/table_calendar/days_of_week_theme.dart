import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

DaysOfWeekStyle daysOfWeekStyleData(TextTheme textTheme) => DaysOfWeekStyle(
  weekdayStyle: textTheme.bodyLarge!,
  weekendStyle: textTheme.bodyLarge!,
  dowTextFormatter: (date, locale) {
    return DateFormat.E(locale).format(date).toUpperCase();
  },
);

extension DaysOfWeekStyleLerp on DaysOfWeekStyle {
  static DaysOfWeekStyle lerp(DaysOfWeekStyle a, DaysOfWeekStyle b, t) {
    return DaysOfWeekStyle(
        dowTextFormatter: a.dowTextFormatter,
        decoration: Decoration.lerp(a.decoration, b.decoration, t) ?? a.decoration,
        weekendStyle: TextStyle.lerp(a.weekendStyle, b.weekendStyle, t) ?? a.weekendStyle,
        weekdayStyle: TextStyle.lerp(a.weekdayStyle, b.weekdayStyle, t) ?? a.weekdayStyle
    );
  }
}