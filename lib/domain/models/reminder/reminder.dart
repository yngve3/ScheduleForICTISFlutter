import 'package:objectbox/objectbox.dart';

import '../../../data/models/event_db.dart';

@Entity()
class Reminder {
  @Id(assignable: true) int? id;
  @Property(type: PropertyType.date)
  DateTime? dateTime;
  String? title;
  String? body;
  final int minutesBefore;

  final ToOne<EventDB> event = ToOne<EventDB>();

  Reminder({
    required this.minutesBefore,
    this.id,
    this.dateTime,
    this.title,
    this.body
  });

  void setFields({
    required String title,
    required int id,
    required DateTime dateTimeBefore,
    String? body,
  }) {
    this.title = title;
    this.body = body;
    this.id = id;
    dateTime = dateTimeBefore.subtract(Duration(minutes: minutesBefore));
  }

  factory Reminder.beforeDateTime(Duration durationBefore) {
    return Reminder(
      minutesBefore: durationBefore.inMinutes
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is! Reminder) return false;
    final Reminder reminder = other;

    if (reminder.minutesBefore == minutesBefore) return true;
    return false;
  }
}