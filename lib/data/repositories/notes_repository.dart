import '../../domain/models/note/note.dart';
import '../../domain/models/schedule_subject/schedule_subject.dart';
import '../../main.dart';
import '../../objectbox.g.dart';

class NotesRepository {
  late final Box<Note> _notesBox;

  NotesRepository() {
    _notesBox = objectBox.store.box<Note>();
  }

  Stream<List<Note>> getNotesByCoupleID(String coupleID, {String? userUID}) {
    final query = _notesBox.query(
        Note_.userUID.equals(userUID ?? "")
            .and(Note_.coupleID.equals(coupleID))
    );
    return query.watch(triggerImmediately: true)
        .map((event) => event.find());
  }

  Future<Note?> getNote(int noteID) {
    return _notesBox.getAsync(noteID);
  }

  List<Note> getNotesAfter(DateTime datetime, {String? userUID, required ScheduleSubject scheduleSubject}) {
    return _notesBox.query(
        Note_.date.greaterOrEqualDate(datetime)
            .and(Note_.userUID.equals(userUID ?? ""))
            .and(Note_.scheduleSubjectID.equals(scheduleSubject.id))
    ).build().find();
  }

  List<Note> getAllNotes({String? userUID, required ScheduleSubject scheduleSubject}) {
    return _notesBox.query(
        Note_.userUID.equals(userUID ?? "")
            .and(Note_.scheduleSubjectID.equals(scheduleSubject.id))
    ).build().find();
  }

  void addNote(Note note) {
    _notesBox.putAsync(note);
  }

  void deleteNote(int noteID) {
    _notesBox.removeAsync(noteID);
  }
}