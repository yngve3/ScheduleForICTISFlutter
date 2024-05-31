import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../colors.dart';

CalendarStyle calendarStyleData(ColorScheme colorScheme, TextTheme textTheme) => CalendarStyle(
  isTodayHighlighted: false,
  tablePadding: const EdgeInsets.symmetric(horizontal: 20),
  defaultTextStyle: textTheme.bodyLarge!,
  outsideTextStyle: textTheme.bodyLarge!.copyWith(color: colorScheme.tertiary),
  selectedTextStyle: textTheme.bodyLarge!.copyWith(color: colorScheme.onPrimary),
  weekendTextStyle: textTheme.bodyLarge!.copyWith(color: CustomColors.red),
  selectedDecoration: BoxDecoration(
    shape: BoxShape.circle,
    color: colorScheme.primary
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