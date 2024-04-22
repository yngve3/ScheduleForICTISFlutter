import 'package:objectbox/objectbox.dart';

@Entity()
class WeekNumber {
  @Id() int id = 0;
  @Index() @Unique(onConflict: ConflictStrategy.replace) final int calendarWeekNumber;
  final int? studyWeekNumber;
  final DateTime weekStartDate;

  WeekNumber({
    required this.calendarWeekNumber,
    required this.weekStartDate,
    this.studyWeekNumber,
  });

  WeekNumber plus(int weekCount) {
    final newDate = switch(weekCount) {
      > 0 => weekStartDate.add(Duration(days: 7 * weekCount)),
      < 0 => weekStartDate.subtract(Duration(days: 7 * weekCount)),
      _ => weekStartDate
    };
    return WeekNumber(
        studyWeekNumber: studyWeekNumber != null ? (studyWeekNumber! + weekCount) : null,
        calendarWeekNumber: calendarWeekNumber + weekCount,
        weekStartDate: newDate
    );
  }
}
