import 'package:objectbox/objectbox.dart';
import 'package:schedule_for_ictis_flutter/domain/models/note_file/note_file.dart';

import '../reminder/reminder.dart';

@Entity()
class Note {
  @Id() int id = 0;
  String title;
  String? description;
  @Property(type: PropertyType.date)
  DateTime date;
  String coupleID;
  String userUID;

  bool get hasFiles => attachedFiles.isNotEmpty;
  bool get isPast => date.isBefore(DateTime.now());
  bool get isActual => date.isAfter(DateTime.now());

  @Backlink("note")
  final ToMany<NoteFile> attachedFiles = ToMany<NoteFile>();
  final ToMany<Reminder> reminders = ToMany<Reminder>();

  Note({
    required this.id,
    required this.title,
    required this.date,
    required this.coupleID,
    required this.userUID,
    this.description,
    List<NoteFile>? files,
    List<Reminder>? reminders
  }) {
    attachedFiles.addAll(files ?? []);
    this.reminders.addAll(reminders ?? []);
  }
}