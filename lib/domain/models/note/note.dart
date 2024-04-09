import 'package:objectbox/objectbox.dart';

@Entity()
class Note {
  @Id() int id = 0;
  final String text;
  final DateTime date;
  final String coupleID;

  Note({
    required this.text,
    required this.date,
    required this.coupleID
  });
}