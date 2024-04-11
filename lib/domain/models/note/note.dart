import 'package:objectbox/objectbox.dart';

@Entity()
class Note {
  @Id() int id;
  final String title;
  final String? description;
  @Property(type: PropertyType.date)
  final DateTime date;
  final String coupleID;

  Note({
    required this.id,
    required this.title,
    required this.date,
    required this.coupleID,
    this.description
  });
}