import '../../domain/models/note/note.dart';
import '../../domain/models/schedule/day_schedule_item.dart';
import '../../main.dart';
import '../../objectbox.g.dart';

class NotesRepository {
  late final Box<Note> _notesBox;

  NotesRepository() {
    _notesBox = objectBox.store.box<Note>();
  }

  Future<List<Note>> getNotesByCoupleID(String coupleID) {
    return _notesBox.query(Note_.coupleID.equals(coupleID)).build().findAsync();
  }

  Future<Note?> getNote(int noteID) {
    return _notesBox.getAsync(noteID);
  }

  void addNote(Note note) {
    _notesBox.putAsync(note);
  }

  void deleteNote(int noteID) {
    _notesBox.removeAsync(noteID);
  }
}