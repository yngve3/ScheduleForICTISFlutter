import '../day_schedule_item.dart';

class DaySchedule {
  final List<DayScheduleItem> items;
  final bool isVPK;

  DaySchedule({
    required this.items,
    this.isVPK = false
  });

  factory DaySchedule.empty() {
    return DaySchedule(
        items: const [],
    );
  }
}