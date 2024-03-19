import 'package:freezed_annotation/freezed_annotation.dart';
part 'schedule_state.freezed.dart';

@freezed
class ScheduleState with _$ScheduleState {
  factory ScheduleState({
    required DateTime selectedDay,
  }) = _ScheduleState;
}
