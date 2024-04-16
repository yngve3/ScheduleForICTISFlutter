import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/reminder/reminder.dart';
import '../../../../utils/my_list.dart';

part 'event_add_state.freezed.dart';

@freezed
class EventAddState with _$EventAddState {
  factory EventAddState({
    int? id,
    @Default("") String title,
    @Default("") String description,
    @Default(null) TimeOfDay? timeStart,
    @Default(null) TimeOfDay? timeEnd,
    @Default(null) DateTime? date,
    @Default(false) bool isSaveButtonEnabled,
    @Default("") String location,
    DBList<Reminder>? reminders
  }) = _EventAddState;
}
