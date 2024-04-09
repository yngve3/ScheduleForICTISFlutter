import '../../domain/models/note/note.dart';
import '../../domain/models/schedule/day_schedule_item.dart';
import '../../main.dart';
import '../../objectbox.g.dart';

class NotesRepository {
  late final Box<Note> _notesBox;

  NotesRepository() {
    _notesBox = objectBox.store.box<Note>();
  }

  Future<List<Note>> getNotesByCouple(Couple couple) {
    return _notesBox.query(Note_.coupleID.equals(couple.id)).build().findAsync();
  }

  void addNote(Note note) {
    _notesBox.putAsync(note);
  }
}