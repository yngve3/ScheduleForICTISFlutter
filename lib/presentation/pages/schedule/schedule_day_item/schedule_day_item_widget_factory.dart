import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule/day_schedule_item.dart';

import 'item_couple.dart';
import 'item_event.dart';
import 'item_unknown.dart';

class ScheduleDayItemWidgetFactory {
  static Widget create(DayScheduleItem dayScheduleItem, {
    VoidCallback? onIndicatorEnd,
    bool showIndicator = false
  }) {
    return switch (dayScheduleItem) {
      Couple _=> ItemCouple(couple: dayScheduleItem),
      Event _=> ItemEvent(event: dayScheduleItem, showIndicator: showIndicator, onIndicatorEnd: onIndicatorEnd),
      _=> const ItemUnknown()
    };
  }
}