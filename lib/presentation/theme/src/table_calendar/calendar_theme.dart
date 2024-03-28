import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/theme_ext/colors_ext.dart';
import 'package:table_calendar/table_calendar.dart';

CalendarStyle calendarStyleData(ThemeColors colors, TextTheme textTheme) => CalendarStyle(
  isTodayHighlighted: false,
  tablePadding: const EdgeInsets.symmetric(horizontal: 20),
  defaultTextStyle: textTheme.bodyLarge!,
  outsideTextStyle: textTheme.bodyLarge!.copyWith(color: colors.disabled),
  selectedTextStyle: textTheme.bodyLarge!.copyWith(color: colors.background),
  weekendTextStyle: textTheme.bodyLarge!.copyWith(color: colors.redIndicator),
  selectedDecoration: BoxDecoration(
      color: colors.accent,
      shape: BoxShape.circle
  ),
);

extension CalendarStyleLerp on CalendarStyle {
  static CalendarStyle lerp(CalendarStyle a, CalendarStyle b, t) {
    return CalendarStyle(
        isTodayHighlighted: a.isTodayHighlighted,
        tablePadding: a.tablePadding,
        defaultTextStyle: TextStyle.lerp(a.defaultTextStyle, b.defaultTextStyle, t) ?? a.defaultTextStyle,
        outsideTextStyle: TextStyle.lerp(a.outsideTextStyle, b.outsideTextStyle, t) ?? a.outsideTextStyle,
        selectedTextStyle: TextStyle.lerp(a.selectedTextStyle, b.selectedTextStyle, t) ?? a.selectedTextStyle,
        weekendTextStyle: TextStyle.lerp(a.weekendTextStyle, b.weekendTextStyle, t) ?? a.weekendTextStyle,
        selectedDecoration: Decoration.lerp(a.selectedDecoration, b.selectedDecoration, t) ?? a.selectedDecoration
    );
  }
}