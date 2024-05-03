import 'package:objectbox/objectbox.dart';

import '../../domain/models/reminder/reminder.dart';

@Entity()
class EventDB {
  @Id() int id;
  final String title;
  final String? description;
  @Property(type: PropertyType.date)
  final DateTime dateTimeStart;
  @Property(type: PropertyType.date)
  final DateTime dateTimeEnd;
  final int weekNum;
  final String? location;
  final ToMany<Reminder> reminders = ToMany<Reminder>();
  final String userUID;

  EventDB({
    this.id = 0,
    required this.title,
    required this.dateTimeStart,
    required this.dateTimeEnd,
    required this.weekNum,
    required this.userUID,
    this.location,
    this.description,
    List<Reminder>? reminders
  }) {
    this.reminders.addAll(reminders ?? []);
  }
}