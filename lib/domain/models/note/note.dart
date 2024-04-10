import 'package:objectbox/objectbox.dart';

@Entity()
class Note {
  @Id() int id = 0;
  final String title;
  final String? description;
  final DateTime date;
  final String coupleID;

  Note({
    required this.title,
    required this.date,
    required this.coupleID,
    this.description
  });
}