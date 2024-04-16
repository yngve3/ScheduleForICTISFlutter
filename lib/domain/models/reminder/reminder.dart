import 'package:objectbox/objectbox.dart';

@Entity()
class Reminder {
  @Id(assignable: true) int? id;
  final int minutesBefore;

  Reminder({required this.minutesBefore});

  factory Reminder.fromDuration(Duration duration) =>
      Reminder(minutesBefore: duration.inMinutes);

  @override
  bool operator ==(Object other) {
    if (other is! Reminder) return false;

    if (other.minutesBefore == minutesBefore) return true;
    return false;
  }
}