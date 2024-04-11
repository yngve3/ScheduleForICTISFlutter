import 'package:objectbox/objectbox.dart';
import 'package:schedule_for_ictis_flutter/domain/models/note_file/note_file.dart';

@Entity()
class Note {
  @Id() int id;
  final String title;
  final String? description;
  @Property(type: PropertyType.date)
  final DateTime date;
  final String coupleID;

  @Backlink("note")
  final ToMany<NoteFile> attachedFiles = ToMany<NoteFile>();

  Note({
    required this.id,
    required this.title,
    required this.date,
    required this.coupleID,
    this.description
  });
}