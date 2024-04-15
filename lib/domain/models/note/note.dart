import 'package:objectbox/objectbox.dart';
import 'package:schedule_for_ictis_flutter/domain/models/note_file/note_file.dart';

@Entity()
class Note {
  @Id() int id = 0;
  String title;
  String? description;
  @Property(type: PropertyType.date)
  DateTime date;
  String coupleID;

  bool get hasFiles => attachedFiles.isNotEmpty;

  @Backlink("note")
  final ToMany<NoteFile> attachedFiles = ToMany<NoteFile>();

  Note({
    required this.title,
    required this.date,
    required this.coupleID,
    this.description
  });

  void update({
    String? title,
    String? description,
    DateTime? date,
    List<NoteFile>? files
  }) {
    this.title = title ?? this.title;
    this.description = description ?? this.description;
    this.date = date ?? this.date;
    if (files != null) {
      attachedFiles.clear();
      attachedFiles.addAll(files);
    }
  }
}