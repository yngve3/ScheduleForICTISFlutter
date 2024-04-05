import 'package:objectbox/objectbox.dart';

@Entity()
class EventDB {
  @Id() int id = 0;
  final String timeStart;
  final String timeEnd;
  final String title;
  final String? description;
  @Property(type: PropertyType.date)
  final DateTime date;
  final int weekNum;
  final String? location;

  EventDB({
    required this.timeStart,
    required this.timeEnd,
    required this.title,
    required this.date,
    required this.weekNum,
    this.location,
    this.description
  });
}