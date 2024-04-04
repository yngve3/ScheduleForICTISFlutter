import 'package:objectbox/objectbox.dart';

@Entity()
class WeekNumber {
  final int? studyWeekNumber;
  @Id(assignable: true) final int calendarWeekNumber;

  const WeekNumber({
    this.studyWeekNumber,
    required this.calendarWeekNumber
  });

  WeekNumber plus(int weekCount) =>
      WeekNumber(
          studyWeekNumber: studyWeekNumber != null ? (studyWeekNumber! + weekCount) : null,
          calendarWeekNumber: calendarWeekNumber + weekCount
      );

  factory WeekNumber.empty() =>
      const WeekNumber(
          studyWeekNumber: 1,
          calendarWeekNumber: 1
      );
}
