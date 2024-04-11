import 'package:schedule_for_ictis_flutter/data/repositories/couples_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/notes_repository.dart';
import 'package:schedule_for_ictis_flutter/domain/models/note/note.dart';

import '../models/schedule/day_schedule_item.dart';

class NotesInteractor {
  final NotesRepository _notesRepository = NotesRepository();
  final CouplesRepository _couplesRepository = CouplesRepository();
  
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
  
  void addNote({
    int? noteID,
    required String title, 
    required DateTime date,
    required String coupleID,
    String? description
  }) {
    _notesRepository.addNote(Note(
      id: noteID ?? 0,
      title: title, 
      date: date, 
      coupleID: coupleID,
      description: description
    ));
  }
  
  void deleteNote(int noteID) {
    _notesRepository.deleteNote(noteID);
  }
}