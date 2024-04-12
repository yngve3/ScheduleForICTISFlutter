import 'package:file_picker/file_picker.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/couples_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/note_files_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/notes_repository.dart';
import 'package:schedule_for_ictis_flutter/domain/models/note/note.dart';

import '../models/note_file/note_file.dart';
import '../models/schedule/day_schedule_item.dart';

class NotesInteractor {
  final NotesRepository _notesRepository = NotesRepository();
  final CouplesRepository _couplesRepository = CouplesRepository();
  final NoteFilesRepository _noteFilesRepository = NoteFilesRepository();
  
  Future<Couple?> getCoupleByID(String id) async {
    final coupleDB = await _couplesRepository.getCoupleByID(id);
    if (coupleDB == null) return null;

    return Couple.fromCoupleDB(coupleDB);
  }

  Stream<List<Note>> getNotesByCoupleID(String coupleID) {
    return _notesRepository.getNotesByCoupleID(coupleID);
  }
  
  Future<Note?> getNoteByID(int id) async {
    return await _notesRepository.getNote(id);
  }

  void deleteFiles(List<int> ids) {
    _noteFilesRepository.deleteFiles(ids);
  }

  Stream<List<NoteFile>> getNoteFiles(int noteID) {
    return _noteFilesRepository.getFilesByNoteID(noteID);
  }

  void addNote({
    int? noteID,
    required String title, 
    required DateTime date,
    required String coupleID,
    String? description,
    List<NoteFile>? files,
    List<int>? deletedFilesIds
  }) {
    final note = Note(
        id: noteID ?? 0,
        title: title,
        date: date,
        coupleID: coupleID,
        description: description
    );

    deleteFiles(deletedFilesIds ?? []);
    note.attachedFiles.addAll(files ?? []);
    _notesRepository.addNote(note);
  }
  
  void deleteNote(int noteID) {
    _notesRepository.deleteNote(noteID);
  }
}