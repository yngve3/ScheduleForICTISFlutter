import '../day_schedule/day_schedule.dart';

class WeekSchedule {
  final int weekNum;
  final List<DaySchedule> daySchedules;

  WeekSchedule({required this.weekNum, required this.daySchedules});

  factory WeekSchedule.empty() {
    return WeekSchedule(
        weekNum: 1,
        daySchedules: List<DaySchedule>.filled(7, DaySchedule.empty()));
  }
}