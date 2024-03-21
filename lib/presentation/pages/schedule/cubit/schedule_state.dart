import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule/schedule.dart';
part 'schedule_state.freezed.dart';

@freezed
class ScheduleState with _$ScheduleState {
  factory ScheduleState({
    required DateTime selectedDay,
    required WeekSchedule weekSchedule
  }) = _ScheduleState;
}
