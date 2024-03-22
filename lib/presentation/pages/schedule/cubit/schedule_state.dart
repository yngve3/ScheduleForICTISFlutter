import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/schedule/week_schedule/week_schedule.dart';
part 'schedule_state.freezed.dart';

@freezed
class ScheduleState with _$ScheduleState {
  factory ScheduleState({
    required DateTime selectedDay,
    required WeekSchedule weekSchedule
  }) = _ScheduleState;
}
