import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule/week_schedule/week_schedule.dart';

import '../../../../domain/models/note/note.dart';
import '../../../../domain/models/schedule/day_schedule_item.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default([]) List<DayScheduleItem> scheduleItems,
    @Default([]) List<Note> notes,
    WeekSchedule? weekSchedule
  }) = _HomePageState;
}
