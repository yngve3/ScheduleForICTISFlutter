import '../../domain/models/note_file/note_file.dart';
import '../../main.dart';
import '../../objectbox.g.dart';

class NoteFilesRepository {
  late Box<NoteFile> _noteFilesBox;

  NoteFilesRepository() {
    _noteFilesBox = objectBox.store.box<NoteFile>();
  }

  void addFile(NoteFile file) {
    _noteFilesBox.putAsync(file);
  }

  void deleteFile(int fileID) {
    _noteFilesBox.removeAsync(fileID);
  }

  Stream<List<NoteFile>> getFilesByNoteID(int noteID) {
    return _noteFilesBox.query(NoteFile_.note.equals(noteID))
        .watch(triggerImmediately: true)
        .map((event) => event.find());
  }
}