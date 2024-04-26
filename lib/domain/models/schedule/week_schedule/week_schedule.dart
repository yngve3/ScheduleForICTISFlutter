import 'package:schedule_for_ictis_flutter/domain/models/week_number/week_number.dart';

import '../day_schedule/day_schedule.dart';

class WeekSchedule {
  final WeekNumber weekNumber;
  final List<DaySchedule> daySchedules;

  WeekSchedule({required this.weekNumber, required this.daySchedules});

  factory WeekSchedule.empty() {
    return WeekSchedule(
        weekNumber: WeekNumber.empty(),
        daySchedules: List<DaySchedule>.filled(7, DaySchedule.empty()));
  }
}