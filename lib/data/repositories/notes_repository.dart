import '../../domain/models/note/note.dart';
import '../../main.dart';
import '../../objectbox.g.dart';

class NotesRepository {
  late final Box<Note> _notesBox;

  NotesRepository() {
    _notesBox = objectBox.store.box<Note>();
  }

  Stream<List<Note>> getNotesByCoupleID(String coupleID, {String? userUID}) {
    return _notesBox.query(Note_.coupleID.equals(coupleID).and(Note_.userUID.equals(userUID ?? "")))
        .watch(triggerImmediately: true)
        .map((event) => event.find());
  }

  Future<Note?> getNote(int noteID) {
    return _notesBox.getAsync(noteID);
  }

  List<Note> getNotesAfter(DateTime datetime, {String? userUID}) {
    final query = _notesBox.query(Note_.date.greaterOrEqualDate(datetime).and(Note_.userUID.equals(userUID ?? "")));
    return query.build().find();
  }

  List<Note> getAllNotes({String? userUID}) {
    return _notesBox.query(Note_.userUID.equals(userUID ?? "")).build().find();
  }

  void addNote(Note note) {
    _notesBox.putAsync(note);
  }

  void deleteNote(int noteID) {
    _notesBox.removeAsync(noteID);
  }
}