import 'dart:async';

import '../../domain/models/note/note.dart';
import '../../domain/models/schedule_subject/schedule_subject.dart';
import '../../main.dart';
import '../../objectbox.g.dart';

class NotesRepository {
  late final Box<Note> _notesBox;

  NotesRepository() {
    _notesBox = objectBox.store.box<Note>();
  }

  final _controller = StreamController<List<Note>>();
  Stream<List<Note>> get notes => _controller.stream;

  Stream<List<Note>> getNotesByCoupleID(String coupleID, {String? userUID}) {
    final query = _notesBox.query(
        Note_.userUID.equals(userUID ?? "")
            .and(Note_.coupleID.equals(coupleID))
    );
    return query.watch(triggerImmediately: true)
        .map((event) => event.find());
  }

  Note? getNote(int noteID) {
    return _notesBox.get(noteID);
  }

  void getNotesAfter(DateTime dateTime, {String? userUID, required List<ScheduleSubject> scheduleSubjects}) {
    final query = _getQuery(dateTime, scheduleSubjects);
    query?.watch(triggerImmediately: true).forEach((element) => _controller.add(element.find()));
  }

  List<Note> getAllNotes({String? userUID, required ScheduleSubject scheduleSubject}) {
    return _notesBox.query(
        Note_.userUID.equals(userUID ?? "")
            .and(Note_.scheduleSubjectID.equals(scheduleSubject.id))
    ).build().find();
  }

  QueryBuilder<Note>? _getQuery(DateTime dateTime, List<ScheduleSubject> scheduleSubjects) {
    if (scheduleSubjects.length == 1) {
      return _notesBox.query(
          Note_.scheduleSubjectID.equals(scheduleSubjects[0].id)
              .and(Note_.date.greaterOrEqualDate(dateTime))
      );
    } else if (scheduleSubjects.length == 2) {
      return _notesBox.query(
          Note_.scheduleSubjectID.equals(scheduleSubjects[0].id)
              .or(Note_.scheduleSubjectID.equals(scheduleSubjects[1].id))
              .and(Note_.date.greaterOrEqualDate(dateTime))
      );
    }

    return null;
  }

  void addNote(Note note) {
    _notesBox.putAsync(note);
  }

  void deleteNote(int noteID) {
    _notesBox.removeAsync(noteID);
  }
}