import 'package:objectbox/objectbox.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/date_time_ext.dart';

@Entity()
class WeekNumber {
  @Id() int id = 0;
  @Index() @Unique(onConflict: ConflictStrategy.replace) final int calendarWeekNumber;
  final int? studyWeekNumber;
  @Property(type: PropertyType.date)
  final DateTime weekStartDate;

  WeekNumber({
    required this.calendarWeekNumber,
    required this.weekStartDate,
    this.studyWeekNumber,
  });

  WeekNumber plus(int weekCount) {
    final newDate = switch(weekCount) {
      > 0 => weekStartDate.add(Duration(days: 7 * weekCount)),
      < 0 => weekStartDate.subtract(Duration(days: (7 * weekCount).abs())),
      _ => weekStartDate
    };
    return WeekNumber(
        studyWeekNumber: studyWeekNumber != null ? (studyWeekNumber! + weekCount) : null,
        calendarWeekNumber: calendarWeekNumber + weekCount,
        weekStartDate: newDate
    );
  }

  factory WeekNumber.empty() {
    final date = DateTime.now();
    return WeekNumber(
      calendarWeekNumber: date.weekNumber,
      weekStartDate: date.subtract(Duration(days: date.weekday - 1))
    );
  }
}
