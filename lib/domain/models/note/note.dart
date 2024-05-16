import 'package:objectbox/objectbox.dart';
import 'package:schedule_for_ictis_flutter/domain/models/note_file/note_file.dart';

import '../../../data/models/couple_db.dart';
import '../reminder/reminder.dart';

@Entity()
class Note {
  @Id() int id = 0;
  String title;
  String? description;
  @Property(type: PropertyType.date)
  DateTime date;
  String userUID;

  bool get hasFiles => attachedFiles.isNotEmpty;
  bool get isPast => date.isBefore(DateTime.now());
  bool get isActual => date.isAfter(DateTime.now());

  @Backlink("note")
  final ToMany<NoteFile> attachedFiles = ToMany<NoteFile>();
  final ToMany<Reminder> reminders = ToMany<Reminder>();

  final String coupleID;
  final String scheduleSubjectID;

  Note({
    required this.title,
    required this.id,
    required this.date,
    required this.userUID,
    required this.coupleID,
    required this.scheduleSubjectID,
    this.description,
    List<NoteFile>? files,
    List<Reminder>? reminders,
    CoupleDB? coupleDB
  }) {
    attachedFiles.addAll(files ?? []);
    this.reminders.addAll(reminders ?? []);
  }
}