import 'package:objectbox/objectbox.dart';

import '../../domain/models/reminder/reminder.dart';

@Entity()
class EventDB {
  @Id() int id;
  final String timeStart;
  final String timeEnd;
  final String title;
  final String? description;
  @Property(type: PropertyType.date)
  final DateTime date;
  final int weekNum;
  final String? location;
  final ToMany<Reminder> reminders = ToMany<Reminder>();

  EventDB({
    this.id = 0,
    required this.timeStart,
    required this.timeEnd,
    required this.title,
    required this.date,
    required this.weekNum,
    this.location,
    this.description,
    List<Reminder>? reminders
  }) {
    this.reminders.addAll(reminders ?? []);
  }
}