import '../day_schedule_item.dart';

class DaySchedule {
  final List<DayScheduleItem> items;

  DaySchedule({required this.items});

  factory DaySchedule.empty() {
    return DaySchedule(items: const []);
  }
}