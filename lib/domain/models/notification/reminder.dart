import 'package:objectbox/objectbox.dart';

@Entity()
class Reminder {
  @Id(assignable: true) final int id;
  @Property(type: PropertyType.date)
  final DateTime dateTime;
  final String title;
  final String description;
  final String? body;

  const Reminder({
    required this.id,
    required this.dateTime,
    required this.title,
    required this.description,
    this.body
  });
}