import '../day_schedule_item.dart';

class DaySchedule {
  final List<DayScheduleItem> items;
  final bool isVPK;
  final bool isVUC;

  DaySchedule({
    required this.items,
    this.isVPK = false,
    this.isVUC = false
  });

  factory DaySchedule.empty() {
    return DaySchedule(
        items: const [],
    );
  }
}